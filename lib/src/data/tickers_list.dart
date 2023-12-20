import 'package:stock_market_data/src/data/company_tickers.dart';
import 'package:stock_market_data/src/data/crypto_tickers.dart';

/// Kind of stable static tickers list
class TickersList {
  /// List of main indexes
  static Map<String, String> main = {
    '^GSPC': 'SP500', // Standard & Poor's 500 Index
    '^NDX': 'Nasdaq 100', // Nasdaq-100 Index
    'IWM': 'Russell 2000', // Russell 2000 Index ETF
    'IWB': 'Russell 1000', // Russell 1000 Index ETF
    'DIA':
        'Dow Jones Industrial Average ETF', // Tracks the Dow Jones Industrial Average
    'QQQ': 'Invesco QQQ', // ETF tracking the Nasdaq-100 Index
    'VTI':
        'Vanguard Total Stock Market ETF', // Tracks the CRSP US Total Market Index
    'VOO': 'Vanguard S&P 500 ETF', // Tracks the S&P 500 Index
    'EFA':
        'iShares MSCI EAFE ETF', // Tracks the MSCI EAFE Index (developed markets excluding the U.S. and Canada)
    'EEM':
        'iShares MSCI Emerging Markets ETF', // Tracks the MSCI Emerging Markets Index
    'EWJ': 'iShares MSCI Japan ETF', // Tracks Japanese market
    'FXI':
        'iShares China Large-Cap ETF', // Tracks the FTSE China 50 Index (large-cap Chinese stocks)
    'VUSA.AS': 'Vanguard S&P 500 UCITS ETF', // Tracks the S&P 500 Index
    'EXXT.DE':
        'iShares Exponential Technologies ETF', // Tracks the Morningstar Exponential Technologies Index
  };

  /// Main bonds
  static Map<String, String> bonds = {
    '^IRX': 'USA 13 Week Bond yield',
    '^FVX': 'Treasury Yield 5 Years ',
    '^TNX': 'Treasury Yield 10 Years ',
    '^TYX': 'Treasury Yield 30 Years',
    'AGG':
        'iShares Core U.S. Aggregate Bond ETF', // Tracks an index of US investment-grade bonds
    'BND':
        'Vanguard Total Bond Market ETF', // Broad, diverse portfolio of US bonds
    'TLT':
        'iShares 20+ Year Treasury Bond ETF', // Tracks long-term U.S. Treasury bonds
    'LQD':
        'iShares iBoxx Investment Grade Corporate Bond ETF', // Corporate bonds
    'JNK': 'SPDR Bloomberg High Yield Bond ETF', // High-yield, high-risk bonds
  };

  /// ETFs for specific sectors
  static Map<String, String> sectors = {
    'XLE': 'Energy',
    'XLF': 'Financials',
    'XLU': 'Utilities',
    'XLI': 'Industrials',
    'XLV': 'Health Care',
    'XLY': 'Consumer Discretionary',
    'XLP': 'Consumer Staples',
    'XLB': 'Materials',
    'VNQ': 'Real Estate (Vanguard)',
    'REET': 'Global Real Estate',
    'XLC': 'Communication Services',
    'FCOM': 'Telecommunication Services',
    'XLK': 'Technology',
    'VGT': 'Information Technology (Vanguard)',
    'VHT': 'Health Care (Vanguard)',
    'VFH': 'Financials (Vanguard)',
    'VCR': 'Consumer Discretionary (Vanguard)',
    'VDC': 'Consumer Staples (Vanguard)',
    'VDE': 'Energy (Vanguard)',
    'VAW': 'Materials (Vanguard)',
    'VIS': 'Industrials (Vanguard)',
    'VOX': 'Communication Services (Vanguard)',
    'VPU': 'Utilities (Vanguard)',
    'VREX': 'Real Estate Ex-US (Vanguard)',
    'VIOG': 'S&P Small-Cap 600 Growth',
    'VIOV': 'S&P Small-Cap 600 Value',
    'VIOO': 'S&P Small-Cap 600',
    'VBK': 'Small-Cap Growth',
    'VBR': 'Small-Cap Value',
    'VB': 'Small-Cap',
    'VUG': 'Growth',
    'VTV': 'Value',
    'VO': 'Mid-Cap',
    'VOE': 'Mid-Cap Value',
    'VOT': 'Mid-Cap Growth',
    'VV': 'Large-Cap',
    'MGC': 'Mega-Cap',
    'MGK': 'Mega-Cap Growth',
    'MGV': 'Mega-Cap Value',
    'VTI': 'Total Stock Market',
    'BND': 'Total Bond Market',
    'BSV': 'Short-Term Bond',
    'BIV': 'Intermediate-Term Bond',
    'BLV': 'Long-Term Bond',
    'BNDX': 'Total International Bond',
    'VXUS': 'Total International Stock',
    'VGK': 'European Stock',
    'VPL': 'Pacific Stock',
    'VWO': 'Emerging Markets Stock',
    'VIG': 'Dividend Appreciation',
    'VYM': 'High Dividend Yield',
  };

  /// ETFs for specific countries
  static Map<String, String> countries = {
    'URTH': 'Whole World',
    'RSX': 'Russia',
    'EWL': 'Switzerland',
    'EWU': 'United Kingdom',
    'EWI': 'Italy',
    'EWP': 'Spain',
    'EWA': 'Australia',
    'AFK': 'Africa',
    'EGPT': 'Egypt',
    'MCHI': 'China',
    'FXI': 'China Large Cap',
    'CQQQ': 'China Technology',
    'THD': 'Thailand',
    'EWY': 'South Korea',
    'EWM': 'Malaysia',
    'EWS': 'Singapore',
    'EWG': 'Germany',
    'EWC': 'Canada',
    'EWZ': 'Brazil',
    'EWW': 'Mexico',
    'ARGT': 'Argentina',
    'EPU': 'Peru',
    'INDA': 'India',
    'INDY': 'India 50',
    'EIDO': 'Indonesia',
    'JPXN': 'Japan, Nikkei 400',
    'EWJ': 'Japan',
    'EWQ': 'France',
    'GREK': 'Greece',
    'NORW': 'Norway',
    'ENZL': 'New Zealand',
    'EWD': 'Sweden',
    'EWK': 'Belgium',
    'EWN': 'Netherlands',
    'EIRL': 'Ireland',
    'EPOL': 'Poland',
    'EWO': 'Austria',
    'TUR': 'Turkey',
    'ECH': 'Chile',
    'ECNS': 'China Small Cap',
    'QAT': 'Qatar',
    'UAE': 'United Arab Emirates',
    'KSA': 'Saudi Arabia',
    'PAK': 'Pakistan',
    'EPHE': 'Philippines',
    'EWT': 'Taiwan',
    'VNM': 'Vietnam',
    'HEWI': 'Italy Hedged',
    'DBUK': 'United Kingdom Hedged',
    'EDEN': 'Denmark',
    'EIS': 'Israel',
    'COLX': 'Colombia',
    'GXG': 'Colombia Capped',
    'FJP': 'Japan AlphaDEX',
    'FLFR': 'France AlphaDEX',
    'EZA': 'South Africa',
  };

  static Map<String, String> futures = {
    'ES=F': 'SP500',
    'NQ=F': 'Nasdaq',
    'GC=F': 'Gold',
    'SI=F': 'Silver',
    'CL=F': 'Oil',
    'HG=F': 'Copper',
    'NG=F': 'Natural Gas',
    'ZC=F': 'Corn',
    'ZS=F': 'Soybean',
    'CC=F': 'Cocoa',
    'KC=F': 'Coffee',
    'SB=F': 'Sugar',
    'ZB=F': 'Treasury Bond Futures',
    'ZW=F': 'Wheat', // Wheat Futures
    'ZM=F': 'Soybean Meal', // Soybean Meal Futures
    'ZO=F': 'Oats', // Oats Futures
    'ZR=F': 'Rough Rice', // Rough Rice Futures
    'HE=F': 'Lean Hogs', // Lean Hogs Futures
    'LE=F': 'Live Cattle', // Live Cattle Futures
    'GF=F': 'Feeder Cattle', // Feeder Cattle Futures
    'CT=F': 'Cotton', // Cotton Futures
    'PL=F': 'Platinum', // Platinum Futures
    'PA=F': 'Palladium', // Palladium Futures
  };

  /// ETFs that group companies based on size of the market capitalization
  static Map<String, String> sizes = {
    'VBR': 'Value small',
    'VOE': 'Value mid',
    'VTV': 'Value large',
    'VB': 'Core small',
    'VO': 'Core mid',
    'VV': 'Core large',
    'VBK': 'Growth small',
    'VOT': 'Growth mid',
    'VUG': 'Growth large'
  };

  static Map<String, String> companies = CompaniesTickers.sp500;

  /// Main crypto currencies listed in yahoo finance
  static Map<String, String> cryptoCurrencies = CryptoTickers.top100;
}
