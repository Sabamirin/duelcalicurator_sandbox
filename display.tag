var observer = riot.observable();
<display>
  <!-- View -->
  <div class='playerWrapper'>
    <div class='playerBody' each={playerList}>
      <div class="playerName">{ name }</div>
      <div class='LifePoint'>
        {lifePoint}
      </div>
      <div each={buttonList}>
        <input type="button" value="{value}" onclick="{clickItem}">
      </div>
      <freeInput linkto={name}></freeInput>
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
    const self = this;
    this.clickItem = function (e) {
      const addLP = _CMof.castForNumber(this.value - 0)
      const dstPlayerName = this.name
      this.dealDamage(dstPlayerName, addLP)
    }
    this.calcExecute = function (params) {
      const addLP = _CMof.castForNumber(params.sendVal - 0)
      const dstPlayerName = params.linkto
      this.dealDamage(dstPlayerName, addLP)
    }
    this.dealDamage = function (pName, damage) {
      const dstPlayer = this.playerList.find(function (element, index, array) {
        if (element.name === pName) return true;
      });
      if (dstPlayer) {
        dstPlayer.lifePoint += damage;
        this.update();
      }
    }
    this.addPlayer = function (params) {
      const param = "Player" + _CMof.getHash()
      const addedIndex = this.playerList.push({
        chairId: null,
        name: param,
        lifePoint: 8000
      });
    }
    observer.on("freeInputSend", function (params) {
      self.calcExecute(params)
    });
  </script>
  <!--Style-->
  <style>
     :scope {
      font-size: 1em
    }

    .playerBody {
      width: 300px;
      margin-left: 4px;
      display: block;
      float: left;
    }

    .LifePoint {
      font-size: 3em;
      border: solid silver 3px;
      color: #FF33FF;
      background-color: #FFCC66;
    }

    .playerName {
      background-color: silver;
      color: white;
      margin-bottom: 0px;
    }
  </style>
</display>
<freeInput>
  <!--View-->
  <input type="text" onkeydown="{keyInput}" value="{fieldValue}">
  <div each={keyLeyout}>
    <input type="button" value="{[value]}">
  </div>
  <!--logic-->
  <script>
    //キー入力受付
    this.keyInput = function (e) {
      switch (e.keyCode) {
        case 13:  //Enter
          const sendVal = _CMof.castForNumber(e.currentTarget.value);
          e.currentTarget.value = "";
          observer.trigger("freeInputSend", {
            "sendVal": sendVal,
            "linkto": this.opts.linkto
          });
          break;
      }
    }
    // this.sendcalc = function (params) {
    //   console.log(params);
    //   //親に送る
    //   if (this.parent.pushExecute) {
    //     this.parent.pushExecute(params);
    //   }
    //   return false;
    // }
  </script>
</freeInput>
<chistory>

</chistory>