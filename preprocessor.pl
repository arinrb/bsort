#!/usr/bin/perl
use strict;
use warnings;
use File::Find;
use File::Path;
use Cwd;
use Data::Dumper;
# Preprocess template files from the bsort library.

# Vars
my $templateDir = 'templates';
my $dir = getcwd;
my $blas = 1;

# Build types
my %types = (
    orders => {
	values => {
	    gtabs => {
		name => 'gtabs',
		full => 'absoulte value',
		docRef => 'order by absoulte value',
	    },
	    gt => {
		name => 'gt',
		full => 'greater than',
		docRef => 'order in ascending oder',
	    },
	    lt => {
		name => 'lt',
		full => 'less than',
		docRef => 'order in decending order',
	    }
	},
	none => 0
    },		
    ord => {
	values => {
	    asc => {
		name =>   'asc',
		full =>   'ascending',
		docRef => 'an ascending',
		var =>    'ERROR',
		arg =>    '',
	    },
	    dec => {
		name =>   'dec',
		full =>   'decending',
		docRef => 'a decending',
		var =>    'ERROR',
		arg =>    '',
	    },
	    gen => {
		name =>   'gen',
		full =>   'specified',
		docRef => 'the specified',
		var =>    'ord',
		arg =>    ',ord',
	    }
	},
	none => 0
    },
    data => {
	values => {
	    int => {
		name => 'int',
		full => 'integer',
		docRef => 'an integer',
		blas => 0,
		blasPrefix => 'ERROR',
		var => 'vec',
	    },
	    real => {
		 name => 'real',
		 full => 'real',
		 docRef => 'a real',
		 blas => 1,
		 blasPrefix => 's',
		 var => 'vec',
	    },
	     dble => {
		 name => 'dble',
		 full => 'double precision',
		 docRef => 'a double precision',
		 blas => 1,
		 blasPrefix => 'd',
		 var => 'vec',
	     }
	},
	none => 0
    },
    map => {
	values => {
	    true => {
		name => 'map',
		var =>  'map',
		arg => ',map',
	    }
	},
	none => 1
    },
    sort => {
	values => {
	    quick_sort_recursive => {
		name => 'quick_sort_recursive',
		docRef => 'a recursive three way quick sort',
		maxTestOrder => 4,
	    },
	    quick_sort_flat => {
		name => 'quick_sort_flat',
		docRef => 'a flat three way quick sort',
		maxTestOrder => 4,
	    },
	    interchange_sort => {
		name => 'interchange_sort',
		docRef => 'an interchange sort',
		maxTestOrder => 3,
	    }
	},
	none => 0
    }
    );

# Run accross master templates
find(\&processMasterTemplate,"$dir/$templateDir");

# Run accross templates
find(\&processTemplate,"$dir/$templateDir");

sub getFieldValue {
    my $type = shift;
    my $value = shift;
    my $field = shift;
    
    die "Type $type does not exist\n"  unless (grep {$_ eq $type} keys %types);
    die "Type $value does not exist in type $type\n"  unless (grep {$_ eq $value} keys %{$types{$type}{values}});
    die "Type $field does not exist in type $type value $value\n"  unless (grep {$_ eq $field} keys %{$types{$type}{values}{$value}});

    return $types{$type}{values}{$value}{$field};
}

sub getNone {
    my $type = shift;
    
    die "Type $type does not exist\n"  unless (grep {$_ eq $type} keys %types);

    return $types{$type}{none};
}

sub getTypes {
    return keys %types;
}

sub getValues {
    my $type = shift;

    die "Type $type does not exist\n"  unless (grep {$_ eq $type} keys %types);

    return keys %{$types{$type}{values}};
}

sub getFields {
    my $type = shift;
    my $value = shift;

    die "Type $type does not exist\n"  unless (grep {$_ eq $type} keys %types);
    die "Type $value does not exist in type $type\n"  unless (grep {$_ eq $value} keys %{$types{$type}{values}});

    return keys %{$types{$type}{values}{$value}};
}

sub processMasterTemplate{
    my $dir = $File::Find::dir;
    my $inFile = $_;
    return unless (-f); # Return if not a file
    return unless($inFile =~ /^#MASTER#/); # Return if not a master template
    my $file = $inFile;
    $file =~ s/^#MASTER#//;
    $file = "$dir/$file";
    
    #Read in file
    my $text = '';
    open FILE, "< $dir/$inFile" || die $!;
    while (<FILE>){$text .= $_};
    close FILE;

    # Process loop
    while ($text =~ /#FOR<(.*)>#(.*?)#ENDFOR<\1>#/ms){
	my $args = $1;
	my $loop = $2;
	my $inText = '';

	# Trim newlines from the front $loop
	$loop =~ s/^[\n|\r]//g;
	
	# Build stack
	my %stack = %{buildStack($args)};

	# Run though stack
	while (cycleStack(\%stack)){
	    for my $idx (0...$#{$stack{keyVal}}){
		my $key = $stack{key}[$idx];
		my $value = $stack{keyVal}[$idx][$stack{keyIdx}[$idx]];
		next unless ($args =~ /#${key}#/);
		$inText .= "#SET<${key}><${value}>#\n";
	    }
	    $inText .= $loop;
	}
	
	# Replace loop
	$text =~ s/#FOR<(.*)>#.*?#ENDFOR<\1>#.*?\n?/$inText/ms;
    }
    
    # Write file
    open FILE, "> $file" || die $!;
    print FILE $text;
    close FILE;
}

sub processTemplate {
    my $dir = $File::Find::dir;
    my $inFile = $_;
    return unless (-f); # Return if not a file
    return if($inFile =~ /^#MASTER#/); # Return if a master template

    
    # Make sure output path exits
    $dir =~ /^(.*)${templateDir}(.*?)$/;
    mkpath($1.$2);

    my %stack = %{buildStack($inFile)};

    # Run though stack
    while (cycleStack(\%stack)){

	# Build values
	my %values = ();
	for my $idx (0...$#{$stack{keyVal}}){
	    $values{$stack{key}[$idx]} = $stack{keyVal}[$idx][$stack{keyIdx}[$idx]];
	}

	# Input file
	my $file = $inFile;
	for my $key (keys %values){
	    if ($values{$key} eq '0') {
		$file =~ s/#${key}#//g;
	    }
	    else {
		my $field_value = getFieldValue($key,$values{$key},'name');
		$file =~ s/^#${key}#/${field_value}/g;
		$file =~ s/#${key}#/_${field_value}/g;
	    }
	}
	$file = "$dir/$file";
	$file =~ s/(.*)${templateDir}\/(.*?)/$1$2/;

	# Output text
	my $text = '';

	# Open input
	open FILE, "< $dir/$inFile" || die $!;
	
	# Process line by line
	while (<FILE>) {
	    chomp;
	    my $skip = 0;

	    # Set value
	    if (/#SET<(.*?)><(.*?)>#/){
		$values{$1} = $2;
		$skip = 1;
		next;
	    }

	    # Add title
	    for my $key (keys %values){
		my $value = $values{$key};
		if ($value eq '0'){
		    s/#${key}#//g;
		}
		else {
		    my $field_value = getFieldValue($key,$value,'name');
		    s/#${key}#/_${field_value}/g;
		}
	    }
	    
	    # Basic substitutions
	    for my $key (keys %values){
		my $value = $values{$key};
		if ($value eq '0') {
		    s/#<${key}><.*?>#//g;
		    next;
		}
		for my $field (getFields($key,$value)){
		    my $field_value = getFieldValue($key,$value,$field);
		    s/#<${key}><${field}>#/${field_value}/g;
		}
	    }
	    
	    # Comments
	    next if (/#<C>#/);
	    s/#C<#.*?#>C#//g;

	    # Convert a data type
	    while (/#CON<.*?>#/){
		my $field_value;
		if ($values{data} eq '0') {
		    $field_value = 'ERROR';
		}
		else {
		    $field_value = getFieldValue('data',$values{data},'name');		   
		}
		s/#CON<(.*?)>#/${field_value}($1)/;
	    }

	    # IF THEN ELSE Construct
	    for my $key (keys %values){
		my $value = $values{$key};
		while (/#IF<${key}><(.*?)>THEN<.*?>ELSE<.*?>ENDIF#/){
		    if ($value eq $1) {
			s/#IF<${key}><.*?>THEN<(.*?)>ELSE<.*?>ENDIF#/$1/;
		    }
		    else {
			s/#IF<${key}><.*?>THEN<.*?>ELSE<(.*?)>ENDIF#/$1/;
		    }
		}
	    }

	    # IF THEN Construct
	    for my $key (keys %values){
		my $value = $values{$key};
		while (/#IF<${key}><(.*?)>THEN<.*?>ENDIF#/){
		    if ($value eq $1) {
			s/#IF<${key}><.*?>THEN<(.*?)>ENDIF#/$1/;
		    }
		    else {
			s/#IF<${key}><.*?>THEN<.*?>ENDIF#//;
		    }
		}
	    }

	    # IF Construct
	    for my $key (keys %values){
		my $value = $values{$key};
		while (/#IF<${key}><(.*?)>#/){
		    if ($1 eq $value) {
			s/#IF<${key}><.*?>#//;
		    }
		    else {
			$skip = 1;
			last;
		    }
		}
	    }

	    # UNLESS Construct
	    for my $key (keys %values){
		my $value = $values{$key};
		while (/#UNLESS<${key}><(.*?)>#/){
		    if($value eq $1) {
			$skip = 1;
			last;
		    }
		    s/#UNLESS<${key}><.*?>#//;
		}
	    }

	    # Order compar
	    s/#ORD<(.*?)><(.*?)>#/$1 > $2/g if ($values{ord} eq 'asc');
	    s/#ORD<(.*?)><(.*?)>#/$1 < $2/g if ($values{ord} eq 'dec');
	    my $field_value = getFieldValue('ord','gen','var');
	    s/#ORD<(.*?)><(.*?)>#/${field_value}($1,$2)/g if ($values{ord} eq 'gen');
	    s/#ORD<.*?><.*?>#//g;

	    # Copy
	    while (/#COPY<.*?><.*?><.*?>#/){
		if ($values{data} eq '0'){
		    s/#COPY<(.*?)><(.*?)><.*?>#/$2 = $1/g;
		}
		elsif (getFieldValue('data',$values{data},'blas')) {
		    my $field_value = getFieldValue('data',$values{data},'blasPrefix');
		    s/#COPY<(.*?)><(.*?)><(.*?)>#/${field_value}copy($3,$1,1,$2,1)/g;
		}
		else{
		    s/#COPY<(.*?)><(.*?)><.*?>#/$2 = $1/g;
		}
	    }
	    # Add line of text
	    $text .= $_."\n" unless ($skip == 1);
	}
	#Close input file
	close FILE;

	#Write output
	open FILE, "> $file" || die $!;
	print FILE $text;
	close FILE;
    }
}

sub cycleStack {
    my $stack = shift;
 
    # Process stack
    if ($stack -> {first} == 1){
	$stack -> {first} = 0;
	return 1;
    }
    
    while ($stack -> {idx} < $#{$stack -> {keyIdx}}){	    
	$stack -> {idx}++;
    }

    while ($stack -> {idx} >= 0){
	if ($stack -> {keyIdx}[$stack -> {idx}] < $#{$stack -> {keyVal}[$stack -> {idx}]}) {
	    $stack -> {keyIdx}[$stack -> {idx}]++;
	    return 1;
	}
	$stack -> {keyIdx}[$stack -> {idx}] = 0;
	$stack -> {idx}--;
    }
    return 0;
}

sub buildStack {
    my $line = shift;
    my %stack = (
	idx => 0,
	key => [],
	keyVal => [],
	keyIdx => [],
	first => 1,
	);

    my $idx = -1;
    for my $type (getTypes()){
	$idx++;
	push @{$stack{key}},$type;
	push @{$stack{keyIdx}},0;
	push @{$stack{keyVal}},[];
	if ($line =~ /#${type}#/){
	    push @{$stack{keyVal}[$idx]},'0' if getNone($type);
	    for my $keyVal (getValues($type)){
		push @{$stack{keyVal}[$idx]},$keyVal;
	    }
	}
	else {
	    push @{$stack{keyVal}[$idx]},'0';
	}
    }
    
    return \%stack;
}
