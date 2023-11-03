<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class AppInitialization extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:initialization';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'this task to install dependanceis and run migrations and run seedars';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // key generate
        $this->call('key:generate');

        // jwt secret
        $this->call('jwt:secret');

        // migrate database
        $this->call('migrate');

        // seed fake data if there is no data
        $this->call('db:seed');

        // run application
        $this->info('You can access API from: http://127.0.0.1:8000/');
        $this->call('serve');
    }
}
