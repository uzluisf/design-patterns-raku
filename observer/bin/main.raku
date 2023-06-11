use Item;
use Customer;

my $observer1st = Customer.new: :id<abc@gmail.com>;
my $observer2nd = Customer.new: :id<xyz@hotmail.com>;
my $observer3rd = Customer.new: :id<def@protomail.com>;
 
given Item.new: :name("Nike Shirt") {
    .attach: $observer1st;
    .attach: $observer2nd;
    .update-availability;
    .detach: $observer2nd;
    .attach: $observer3rd;
    .update-availability;
}
