#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use App::BlogAlba;
App::BlogAlba->to_app;
