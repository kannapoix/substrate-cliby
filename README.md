# SubstrateCliby

This is command line interface for parity substrate(https://github.com/paritytech/substrate).  
Maybe I should write this with language in which more easily cross compile. Rust, Go, Haskell...I'm not sure.

## Installation

Use specific_install.

    $ gem install specific_install
    $ gem specific_install -l 'git@github.com:kannapoix/substrate-cliby.git'

## Usage
This will show help messages.

    $ substrate_cliby
    
Default connecting node is localhost:9933.
To specify node to connecting, do following

    $ substrate_cliby <command> --node http://<domain or IP>:<port>

If you want to connect different port which is not 9933 on localhost, just do

    $ substrate_cliby <command> --node http://localhost:<port>
 
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kannapoix/substrate_cliby.
