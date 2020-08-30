const twoDigit = (num) => {
    if (num < 10) return "0"+num;
    return num;
}

const threeDigit = (num) => {
    if (num < 10) return "00"+num;
    if (num < 100) return "0"+num;
    return num;
}