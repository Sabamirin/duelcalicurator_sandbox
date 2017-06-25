const _CMof = (function () {
    const _castForNumber = function (value) {
        return value - 0;
    }
    const _getHash = function () {
        return ("000" + Math.ceil(Math.random()*200)).substr(-3,3)
    }
    return {
        "castForNumber" : _castForNumber,
        "getHash" : _getHash
    }
})();