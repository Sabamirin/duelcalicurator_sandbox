//<script>
  const observer = riot.observable();
  var commonFunc = {
    init: function() {
      console.log("mixin!!")
      },
    parceInput: function (siki) {
      const mOperator = /([\+\-\*\\])/;
      const splited = siki.split(mOperator);
      //整地
      const formatedArray = splited.map(function (value) {
        value = value.trim();
        if (isNaN(value)) {
          //演算子かどうか確認
          if (value.match(mOperator)) {
            return value;
          } else {
            return 0;
          }
        } else {
          //数値変換
          return value - 0;
        }
      });
      //演算
      let initialValue, currentValue, currentOperator, nextValue;
      let temp = [];
      currentValue = formatedArray.splice(0, 1);
      //２つずつ取り出し
      while (true) {
        temp = formatedArray.splice(0, 2);
        //要素がなくなったらおしまい
        if(temp.length !== 2)break;
        switch (temp[0]) {
          case "+":
            currentValue =currentValue + temp[1];
            break;
          case "-":
            currentValue =currentValue - temp[1];
            break;
          case "*":
            currentValue =currentValue * temp[1];
            break;
        }
      }
      return currentValue;
    }
  }
//</script>
