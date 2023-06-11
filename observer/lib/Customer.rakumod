use Observer;
unit class Customer does Observer;

has Str:D $.id is required('because customer must have an ID');

method update(Str:D $item-name --> Nil) {
    say "Sending email to customer [$!id] for item [$item-name]";
}
