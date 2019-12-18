#!/usr/bin/perl
#
use warnings;
use strict;


use GraphViz::Graph;

my $graph = GraphViz::Graph->new('call-tree');

my $edit                 = func('edit'                , 'edit.c'      );
my $getcmdline_int       = func('getcmdline_int'      , 'ex_getln.c'  );
my $plain_vgetc          = func('plain_vgetc'         , 'getchar.c'   );
my $ins_compl_check_keys = func('ins_compl_check_keys', 'insexpand.c' );
my $wait_return          = func('wait_return'         , 'message.c'   );
my $get_number           = func('get_number'          , 'misc1.c'     );
my $do_mouse             = func('do_mouse'            , 'mouse.c'     );
my $normal_cmd           = func('normal_cmd'          , 'normal.c'    );


my $save_vgetc = func('save_vgetc', 'getchar.c');

$graph -> edge($edit                , $save_vgetc);
$graph -> edge($getcmdline_int      , $save_vgetc);
$graph -> edge($plain_vgetc         , $save_vgetc);
$graph -> edge($ins_compl_check_keys, $save_vgetc);
$graph -> edge($wait_return         , $save_vgetc);
$graph -> edge($get_number          , $save_vgetc);
$graph -> edge($normal_cmd          , $save_vgetc);
$graph -> edge($do_mouse            , $save_vgetc);

$graph -> create('png');


sub func {

   my $name   = shift;
   my $source = shift;

   my $nd = $graph->node();
   $nd->label({html=>"<table border='1' cellborder='0'>
       <tr><td>$source</td></tr>
       <tr><td><b>$name</b></td></tr>
    </table>"});

   return $nd;
}
