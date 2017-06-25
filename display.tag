<display>
  <!-- View -->
  <div each={playerList}>
    <div class="playerName">{ name }</div>
    <div class='LifePoint'>
      {lifePoint}
    </div>
    <div each={buttonList}>
      <input type="button" value="{value}" onclick="{clickItem}">
    </div>
  </div>
  <input type="button" value="+" onclick="{addPlayer}">
  <!-- LOGIC -->
  <script>
    this.playerList = []
    this.buttonList = [
      { value: 1000 },
      { value: -1000 }
    ]
    this.clickItem = function (e) {
      const addLP = _CMof.castForNumber(this.value - 0)
      const dstPlayerName = this.name
      const dstPlayer = this.playerList.find(function (element, index, array) {
        if (element.name === dstPlayerName) return true;
      });
      dstPlayer.lifePoint += addLP;
    }

    this.addPlayer = function (params) {
      const param = "Player" + _CMof.getHash()
      const addedIndex = this.playerList.push({
        chairId: null,
        name: param,
        lifePoint: 8000
      });
    }
  </script>
  <!--Style-->
  <style>
     :scope {
      font-size: 1em
    }

    h3 {
      color: #444
    }

    ul {
      color: #999
    }
  </style>
</display>
<tenkey>
  <!--View-->
  <input type="text" onkeydown="{keyInput}" value="{fieldValue}">
  <div each={keyLeyout}>
    <input type="button" value="{[value]}">
  </div>
  <!--logic-->
  <script>
    this.keyLeyout = [
      [7, 8, 9],
      [4, 5, 6],
      [1, 2, 3],
    ]
    this.InputQueue = function () {

    }
    //キー入力受付
    this.keyInput = function (e) {
      switch (e.keyCode) {
        case 13:  //Enter
          console.log(_CMof.castForNumber(this.fieldValue));
          break;
      }
    }
    this.sendcalc = function (params) {
      console.log(params)
      return false;
    }
  </script>
</tenkey>
<chistory>

</chistory>