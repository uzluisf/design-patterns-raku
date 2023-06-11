#| The Observer interface declares the update method, used by subjects.
role Observer is export {
    #| Receive update from subject.
    method update(--> Nil) { ... }
}
