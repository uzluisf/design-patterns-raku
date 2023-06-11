use Subject;
use Observer;
unit class Item does Subject;

has Str:D $.name is required('because an item must have a name');

has Bool:D $!in-stock = False;
has Observer:D @!observers;

method attach(Observer:D $observer --> Nil) {
    my $already-attached = @!observers.first({ $_ eqv $observer });

    if $already-attached {
        say "Item: Observer has been attached already" if %*ENV<VERBOSE>;
    }
    else {
        @!observers.push($observer);
        say "Item: Attached an observer" if %*ENV<VERBOSE>; 
    }
}

method detach(Observer:D $observer --> Nil) {
    my $idx = @!observers.first({ $_ eqv $observer }, :k);
    if $idx {
        @!observers.splice($idx, 1);
        say "Item: Detached an observer" if %*ENV<VERBOSE>;
    }
}

method notify-all(--> Nil) {
    say "Item: Notifying all observers..." if %*ENV<VERBOSE>;
    $_.update($!name) for @!observers;
}

method update-availability(--> Nil) {
    say "Item [$!name] is now in stock";
    $!in-stock = True;
    self.notify-all();
}
