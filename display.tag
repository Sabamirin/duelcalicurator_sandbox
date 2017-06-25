<display>
  <!-- View -->
  <div class="playerName">{ player.name }</div>
  <div class='LifePoint'>
    {player.lifePoint}
  </div>
  <div each={buttonList}>
    <input type="button" value="{value}" onclick="{clickItem}">
  </div>
  <!-- LOGIC -->
  <script>
    this.player = {
      name: "Test",
      lifePoint: 8000
    }
    this.buttonList = [
      { value: 1000 },
      { value: -1000 }
    ]
    this.clickItem = function (e) {
      console.log(e.item.value - 0)
      this.player.lifePoint += (e.item.value - 0)
      //console.log(this.player.lifePoint)
      this.update()
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
  <span>TENKEY!</span>
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
      switch(e.keyCode){
        case 13:  //Enter
          console.log(this.fieldValue);
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