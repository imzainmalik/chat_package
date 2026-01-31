<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        // 1. Conversations (Group or Private wrapper)
        Schema::create('chatify_conversations', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->enum('type', ['private', 'group'])->default('private');
            $table->string('name')->nullable(); // For groups
            $table->string('avatar')->nullable(); // For groups
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();
        });

        // 2. Participants (Pivot table for Users <-> Conversations)
        Schema::create('chatify_participants', function (Blueprint $table) {
            $table->id();
            $table->uuid('conversation_id');
            $table->unsignedBigInteger('user_id');
            $table->enum('role', ['admin', 'member'])->default('member');
            $table->timestamp('last_read_at')->nullable();
            $table->timestamps();

            $table->foreign('conversation_id')->references('id')->on('chatify_conversations')->onDelete('cascade');
            // Assuming standard Laravel users table exists
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });

        // 3. Messages
        Schema::create('chatify_messages', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('conversation_id');
            $table->unsignedBigInteger('sender_id');
            $table->text('content')->nullable();
            $table->enum('type', ['TEXT', 'IMAGE', 'VOICE', 'FILE'])->default('TEXT');
            
            // Attachment info (JSON for flexibility: url, size, mime_type, original_name)
            $table->json('attachment')->nullable(); 
            
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('conversation_id')->references('id')->on('chatify_conversations')->onDelete('cascade');
            $table->foreign('sender_id')->references('id')->on('users')->onDelete('cascade');
        });

        // 4. Message Status (Read Receipts)
        Schema::create('chatify_message_status', function (Blueprint $table) {
            $table->id();
            $table->uuid('message_id');
            $table->unsignedBigInteger('user_id'); // Receiver
            $table->enum('status', ['DELIVERED', 'READ'])->default('DELIVERED');
            $table->timestamp('updated_at')->useCurrent();

            $table->foreign('message_id')->references('id')->on('chatify_messages')->onDelete('cascade');
        });

        // 5. Reactions
        Schema::create('chatify_reactions', function (Blueprint $table) {
            $table->id();
            $table->uuid('message_id');
            $table->unsignedBigInteger('user_id');
            $table->string('emoji');
            $table->timestamps();

            $table->foreign('message_id')->references('id')->on('chatify_messages')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('chatify_reactions');
        Schema::dropIfExists('chatify_message_status');
        Schema::dropIfExists('chatify_messages');
        Schema::dropIfExists('chatify_participants');
        Schema::dropIfExists('chatify_conversations');
    }
};
