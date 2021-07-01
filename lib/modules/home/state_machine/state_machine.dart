abstract class StateMachine {
  Future enter() async {
    print('Enter the state: $this');
  }

  Future exit() async {
    print('Exit the state: $this');
  }
}
