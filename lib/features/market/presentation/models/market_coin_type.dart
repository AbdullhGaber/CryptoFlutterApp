enum MarketCoinType {
  BITCOIN,
  CHAINLINK,
  CARDANO,
  SHIBA_INU,
  HIFI,
  REN;

  String getName() {
    switch (this) {
      case BITCOIN: return 'Bitcoin';
      case CHAINLINK: return 'Chainlink';
      case CARDANO: return 'Cardano';
      case SHIBA_INU: return 'SHIBA INU';
      case HIFI: return 'HIFI';
      case REN: return 'REN';
    }
  }

  String getSymbol() {
    switch (this) {
      case BITCOIN: return 'BTC';
      case CHAINLINK: return 'LINK';
      case CARDANO: return 'ADA';
      case SHIBA_INU: return 'SHIB';
      case HIFI: return 'MFT';
      case REN: return 'REN';
    }
  }

  String getIconPath() {
    switch (this) {
      case BITCOIN: return 'assets/svgs/bitcoin.svg';
      case CHAINLINK: return 'assets/svgs/link.svg';
      case CARDANO: return 'assets/svgs/ada.svg';
      case SHIBA_INU: return 'assets/svgs/shib.svg';
      case HIFI: return 'assets/svgs/hifi.svg';
      case REN: return 'assets/svgs/ren.svg';
    }
  }

  String getPrice() {
    return '32,697.05'; 
  }

  String getChange() {
    switch (this) {
      case BITCOIN: return '+0.81%';
      case CHAINLINK: return '-0.81%';
      case CARDANO: return '+0.81%';
      case SHIBA_INU: return '-0.81%';
      case HIFI: return '-0.81%';
      case REN: return '+0.81%';
    }
  }

  bool isPositive() {
    switch (this) {
      case BITCOIN:
      case CARDANO:
      case REN:
        return true;
      case CHAINLINK:
      case SHIBA_INU:
      case HIFI:
        return false;
    }
  }

  String getCryptoBalance() {
    return '32,697.05';
  }

  String getFiatBalance() {
    return '\$468,554.23';
  }
}