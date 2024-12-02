function formatCurrencyDetailed(value) {
    // Load currency
    if (!value || isNaN(value)) return "0 đồng";
  
    const number = parseFloat(value);
  
    if (number < 1000) {
      return `${number} đồng`;
    } else if (number < 1_000_000) {
      const thousands = Math.floor(number / 1000);
      return `${thousands} ngàn đồng`;
    } else if (number < 1_000_000_000) {
      const millions = Math.floor(number / 1_000_000);
      const remainder = number % 1_000_000;
      const thousands = Math.floor(remainder / 1000);
      if (thousands > 0) {
        return `${millions} triệu ${thousands} ngàn đồng`;
      } else {
        return `${millions} triệu đồng`;
      }
    } else if (number < 1_000_000_000_000) {
      const billions = Math.floor(number / 1_000_000_000);
      const remainder = number % 1_000_000_000;
      const millions = Math.floor(remainder / 1_000_000);
      if (millions > 0) {
        return `${billions} tỉ ${millions} triệu đồng`;
      } else {
        return `${billions} tỉ đồng`;
      }
    } else {
      return `${(number / 1_000_000_000_000).toFixed(0)} nghìn tỉ đồng`;
    }
  }