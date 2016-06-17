function FruitMachine() {
  var black = Symbol("black");
  var white = Symbol("white");
  var green = Symbol("green");
  var yellow = Symbol("yellow");
  var FLOAT = 10000000;
  this.money = FLOAT;

  this.arrayOfColours = [black, white, green, yellow]

  this.getRandomColour = function() {
    return _getRandomArrayItem(this.arrayOfColours);
  }

  _getRandomArrayItem = function(array) {
    return array[Math.floor(Math.random() * array.length)];
  }

  this.play = function() {
    var playResult = [];
    for (var i = 0; i < 4; i ++){
      playResult[i] = this.getRandomColour();
    }
    return playResult;
  };

  this.isJackpot = function(arrayOfColours) {
    return checkIfValuesSame(arrayOfColours);
  }

  checkIfValuesSame = function(array) {
    for(var i = 1; i < array.length; i++) {
      if(array[i] !== array[0]){
        return false;
      }
      return true;
    }
  }

}
