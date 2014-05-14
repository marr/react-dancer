package demo;
use Dancer ':syntax';
use Dancer::Plugin::Ajax;
use Dancer::Plugin::Database;
use strict;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

ajax '/comments' => sub {
    if (param('text') and param('author')) {
        database->quick_insert('comments', {
            author => param('author'),
            text => param('text')
        });
    }
    [database->quick_select('comments', {})];
};

true;
