var observer = riot.observable();
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
    <freeInput linkto={name}></freeInput>
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
      const dstPlayer = this.playerList.find(function (element, index, array) {
        if (element.name === dstPlayerName) return true;
      });
      dstPlayer.lifePoint += addLP;
    }
    this.pushExecute = function (params) {
      const addLP = _CMof.castForNumber(params.sendVal);
      const dstPlayerName = params.linkto;
      const dstPlayer = this.playerList.find(function (element, index, array) {
        if (element.name === dstPlayerName) return true;
      });
      dstPlayer.lifePoint += addLP;
      
      this.update();
    }
    this.addPlayer = function (params) {
      const param = "Player" + _CMof.getHash()
      const addedIndex = this.playerList.push({
        chairId: null,
        name: param,
        lifePoint: 8000
      });
    }
    observer.on("freeInputSend",function(params){
        self.pushExecute(params)
    });
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
<freeInput>
  <!--View-->
  <input type="text" onkeydown="{keyInput}" value="{fieldValue}">
  <p>linkto:{opts.linkto}</p>
  <div each={keyLeyout}>
    <input type="button" value="{[value]}">
  </div>
  <!--logic-->
  <script>
    this.InputQueue = function () {

    }
    //キー入力受付
    this.keyInput = function (e) {
      switch (e.keyCode) {
        case 13:  //Enter
          const sendVal = _CMof.castForNumber(e.currentTarget.value);
          e.currentTarget.value = "";
          observer.trigger("freeInputSend",{
            "sendVal":sendVal,
            "linkto" :this.opts.linkto
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