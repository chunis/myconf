#!/usr/bin/perl

# Author: Chunis Deng (chunchengfh@gmail.com)
# Version: 0.1 @ 2011/05/08

use strict;
use warnings;

use utf8;
#use Encode;

use LWP::Simple;


my $url = "http://tq.8684.cn/shanghai_shanghai";
my $str = get($url);
#print "str: $str\n";
#$str = decode("gb2312",$str);
#$str = encode("gb2312", $str);

my @newstr = $str =~ m{(<div class="level".*?</div>)}gs;
my $weather = $newstr[0];
#print "weather: $weather\n";

@newstr = $weather =~ m{<p>(.*?)</p>}gs;
#print "$_\n" for(@newstr);

my $cnt = 0;
for(@newstr){
	$cnt++;
	last if $cnt >= 5;

	$_ =~ s/上海天气//;
	$_ =~ s/气温//;
	$_ =~ s/,[^,]*?$//;

	if($cnt == 1){
		print "$_";
	} else {
		print ",$_";
	}
}

