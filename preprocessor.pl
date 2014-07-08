#!/usr/bin/perl
use strict;
use warnings;
use File::Find;
use Cwd;

# Preprocess template files from the bsort library.

# Vars
my $templateDir = 'templates';
my $dir = getcwd;

# Build types
my %ord = 
    (
     asc => {
	 name =>   'asc',
	 full =>   'ascending',
	 docRef => 'an ascending',
	 var =>    'ERROR',
	 arg =>    ''
     },
     dec => {
	 name =>   'dec',
	 full =>   'decending',
	 docRef => 'a decending',
	 var =>    'ERROR',
	 arg =>    ''
     },
     gen => {
	 name =>   'gen',
	 full =>   'specified',
	 docRef => 'the specified',
	 var =>    'ord',
	 arg =>    ',ord'
     }
    );

my %data = 
    (
     int => {
	 name => 'int',
	 full => 'integer',
	 docRef => 'an integer'
     },
     real => {
	 name => 'real',
	 full => 'real',
	 docRef => 'a real'
     },
     dble => {
	 name => 'dble',
	 full => 'double precision',
	 docRef => 'a double precision'
     }
    );

my %map =
    (
     true => {
	 name => 'map',
	 var =>  'map',
	 arg => ',map'
     },
     false => {
	 name => 'ERROR',
	 var => 'ERROR',
	 arg => ''
     }
    );

# Run accross templates
find(\&processTemplate,"$dir/$templateDir");

sub processTemplate {
    my $dir = $File::Find::dir;
    my $inFile = $_;
    return unless (-f); # Return if not a file
    print $inFile."\n";

    # Build set of keys
    my %keys;
    $keys{map}  = ($inFile =~ /_map/)  ? [keys %map]  : ['false'];
    $keys{data} = ($inFile =~ /_data/) ? [keys %data] : ['int'];
    $keys{ord}  = ($inFile =~ /_ord/)  ? [keys %ord]  : ['asc'];
    
    # Run accross all versions
    for my $ord (@{$keys{ord}}){
	for my $map (@{$keys{map}}){
	    for my $data (@{$keys{data}}){
		# Set file name
		my $file = "$dir/$inFile";
		$file =~ s/(.*)$templateDir\//$1/;
		if ($map eq 'false') {
		    $file =~ s/(.*)_map/$1/;
		}
		else {
		    $file =~ s/(.*_)map/$1$map{$map}{name}/;
		}
		$file =~ s/(.*_)data/$1$data{$data}{name}/;
		$file =~ s/(.*_)ord/$1$ord{$ord}{name}/;
		
		# Output text
		my $text = '';
		
		# Open input file for reading
		open FILE, "< $dir/$inFile" || die $!;
		
		# Process line by line
		while (<FILE>){
		    chomp;
		    my $skip = 0;

		    # Basic substitutions
		    s/_#MAP_NAME#//g if ($map eq 'false');
		    s/#MAP_NAME#/$map{$map}{name}/g;
		    s/#MAP_VAR#/$map{$map}{var}/g;
		    s/#MAP_ARG#/$map{$map}{arg}/g;
		    s/#DATA_NAME#/$data{$data}{name}/g;
		    s/#DATA_FULL#/$data{$data}{full}/g;
		    s/#DATA_DOCREF#/$data{$data}{docRef}/g;
		    s/#ORD_NAME#/$ord{$ord}{name}/g;
		    s/#ORD_FULL#/$ord{$ord}{full}/g;
		    s/#ORD_DOCREF#/$ord{$ord}{docRef}/g;
		    s/#ORD_VAR#/$ord{$ord}{var}/g;
		    s/#ORD_ARG#/$ord{$ord}{arg}/g;

		    # Convert data to type
		    while (/#CON#.+?#/){
			s/#CON#(.+?)#/$data{$data}{name}($1)/;
		    }

		    # Comments
		    $skip = 1 if (/#CC#/);
		    s/#C<#.*?#>C#//g;

		    # If ord
		    while (/#IF#ORD#(.+?)#THEN#.*?#ELSE#.*?#ENDIF#/){
			if ($1 eq $ord){
			    s/#IF#ORD#.+?#THEN#(.*?)#ELSE#.*?#ENDIF#/$1/;
			}
			else {
			    s/#IF#ORD#.+?#THEN#.*?#ELSE#(.*?)#ENDIF#/$1/;
			}
		    }
		    while (/#IF#ORD#(.+?)#THEN#.*?#ENDIF#/){
			if ($1 eq $ord){
			    s/#IF#ORD#.+?#THEN#(.*?)#ENDIF#/$1/;
			}
			else {
			    s/#IF#ORD#.+?#THEN#.*?#ENDIF#//;
			}
		    }
		    while (/#IF#ORD#(.+?)#/){
			$skip = 1 if ($ord ne $1);
			s/#IF#ORD#$1#//g;
		    }
		    while (/#IF#NOT#ORD#(.+?)#/){
			$skip = 1 if ($ord eq $1);
			s/#IF#NOT#ORD#$1#//g;
		    }

		    # If data
		    while (/#IF#DATA#(.+?)#/){
			$skip = 1 if ($data ne $1);
			s/#IF#DATA#$1#//g;
		    }
		    while (/#IF#NOT#DATA#(.+?)#/){
			$skip = 1 if ($data eq $1);
			s/#IF#NOT#DATA#$1#//g;
		    }

		    # If map
		    while (/#IF#MAP#THEN#.*?#ELSE#.*?#ENDIF#/){
			if ($map eq 'true'){
			    s/#IF#MAP#THEN#(.*?)#ELSE#.*?#ENDIF#/$1/;
			}
			else{
			    s/#IF#MAP#THEN#.*?#ELSE#(.*?)#ENDIF#/$1/;
			}
		    }
		    while (/#IF#MAP#THEN#.*?#ENDIF#/){
			if ($map eq 'true'){
			    s/#IF#MAP#THEN#(.*?)#ENDIF#/$1/;
			}
			else {
			    s/#IF#MAP#THEN#.*?#ENDIF#//;
			}
		    }
		    while (/#IF#MAP#/){
			$skip = 1 if ($map eq 'false');
			s/#IF#MAP#//g;
		    }
		    while (/#IF#NOT#MAP#/){
			$skip =1 if ($map eq 'true');
			s/#IF#NOT#MAP#//g;
		    }

		    # Order compare
		    s/#ORD#(.+?)#(.+?)#/$1 > $2/g if($ord eq 'asc');
		    s/#ORD#(.+?)#(.+?)#/$1 < $2/g if($ord eq 'dec');
		    s/#ORD#(.+?)#(.+?)#/$ord{$ord}{var}($1,$2)/g if($ord eq 'gen');
		    		    
		    # Add line to text
#		    print $_."\n" unless $skip == 1;
		    $text .= $_."\n" unless $skip == 1;

		}
   
		# Close input file
		close FILE;

		# Write output
		open FILE, "> $file" || die $!;
		print FILE $text;
		close FILE;
	    }
	}
    }
}

