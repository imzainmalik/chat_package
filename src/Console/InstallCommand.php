<?php

namespace ChatifyPro\Console;

use Illuminate\Console\Command;

class InstallCommand extends Command
{
    protected $signature = 'chatify:install';
    protected $description = 'Install Chatify Pro package resources';

    public function handle()
    {
        $this->info('Installing Chatify Pro...');

        $this->call('vendor:publish', [
            '--tag' => 'chatify-config',
            '--force' => true
        ]);

        $this->call('vendor:publish', [
            '--tag' => 'chatify-assets',
            '--force' => true
        ]);

        if ($this->confirm('Do you want to run the migrations now?', true)) {
            $this->call('migrate');
        }

        $this->info('Chatify Pro installed successfully.');
        $this->info('Visit /chatify to start chatting!');
    }
}