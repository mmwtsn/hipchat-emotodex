# HipChat Emotodex

## Description
A simple application for viewing and searching all custom emoticons uploaded to a [HipChat](http://www.hipchat.com/) group.

## Example Emotodex
Check out the [Do Something Emotodex](http://emoticons.dosomething.org/) for some custom emoticon ideas. If you like the set give Do Something's Chief Emoji Architect, [Dave Furnes](http://twitter.com/dfurnes) a shout on Twitter!

## Development
To run the Emotodex locally, you will need Ruby, Ruby Gems, Bundler and [Redis](http://redis.io) installed on your system. Redis is an open source key-value store that is used by the HipChat Emotodex as a cache.

If you are interested in deploying your Emotodex, [Heroku](https://devcenter.heroku.com/articles/quickstart) is a free and easy way to host your app. Check out DoSomething.org's fork of this repository for [a description](https://github.com/DoSomething/hipchat-emotodex#hipchat-emotodex) of the changes needed to deploy to Heroku.

To get started:
- Visit the [HipChat admin page](https://www.hipchat.com/admin/emoticons) for your group and upload some custom emoticons
- [Create a HipChat API key](https://hipchat.com/account/api)
- Assign your API key to the "HIPCHAT_API" environment variable (add `export HIPCHAT_API=<your_api_key>` to your `.bash_profile`)
- Clone this repository, `cd` into the HipChat Rolodex directory and run `bundle install`
- `rackup` or to start the server!

## Usage
Once you have the server running click on any emoticon to be prompted with its shortcut. You can also search for an emoticon and press `enter` to trigger the shortcut prompt. Note: this will only trigger once you are down to a single search result.

## Author
[M. Maxwell Watson](http://mmwtsn.com/)

## License
The MIT License (MIT)

````
Copyright (c) 2014 M. Maxwell Watson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
````
