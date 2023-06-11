use Observer;

#| The Subject interface declares a set of methods for managing subscribers.
role Subject is export {
    #| Attach an observer to the subject.
    method attach(Observer:D $observer --> Nil) { ... }

    #| Detach an observer from the subject.
    method detach(Observer:D $observer --> Nil) { ... }

    #| Notify all observers about an event.
    method notify-all(--> Nil) { ... }
}
