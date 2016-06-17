describe('FruitMachine', function() {
  var fruitMachine;

  beforeEach(function() {
    fruitMachine = new FruitMachine();
  });

  it('should be able to be played and return 4 random colour symbols', function(){
    expect(fruitMachine.play().length).toBe(4);
    expect(fruitMachine.arrayOfColours).toContain(fruitMachine.play()[0]);
  });

  it('should return true when jackpot happens i.e. all four symbols are the same', function(){
    var black = Symbol("black");
    expect(fruitMachine.isJackpot([black, black, black, black])).toBe(true);
  })
});
