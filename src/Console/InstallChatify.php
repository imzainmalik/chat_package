<?php

namespace Vendor\ChatifyPro\Console;

use Illuminate\Console\Command;

class InstallChatify extends Command
{
    protected $signature = 'chatify:install';
    protected $description = 'Install Chatify Pro';

    public function handle()
    {
        
        $this->call('vendor:publish', ['--tag' => 'chatify-assets']);
        $this->call('migrate');
        $this->info('Chatify Pro installed successfully.');
    }
}
