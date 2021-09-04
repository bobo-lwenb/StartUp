enum Actions {
  Increment,
  Decrease,
}

int counterReducer(int state, dynamic action) {
  switch (action) {
    case Actions.Increment:
      state++;
      break;
    case Actions.Decrease:
      state--;
      break;
  }
  return state;
}
