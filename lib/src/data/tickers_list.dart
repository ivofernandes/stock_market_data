/// Kind of stable static tickers list
class TickersList {
  /// List of main indexes
  static Map<String, String> main = {
    '^GSPC': 'SP500',
    '^NDX': 'Nasdaq 100',
    'IWM': 'Russell 2000',
    'IWB': 'Russell 1000'
  };

  /// Main bonds
  static Map<String, String> bonds = {
    '^IRX': 'USA 13 Week Bond yield',
    '^FVX': 'Treasury Yield 5 Years ',
    '^TNX': 'Treasury Yield 10 Years ',
    '^TYX': 'Treasury Yield 30 Years'
  };

  /// ETFs for specific sectors
  static Map<String, String> sectors = {
    'XLE': 'Energy',
    'XLF': 'Financials',
    'XLU': 'Utilities',
    'XLI': 'Industrial',
    'XLV': 'Healthcare',
    'XLY': 'Cons Discretionary',
    'XLP': 'Consumer Staples',
    'XLB': 'Materials',
    'REET': 'Real Estate',
    'XLC': 'Communication Services',
    'FCOM': 'Content'
  };

  /// ETFs for specific countries
  static Map<String, String> countries = {
    'URTH': 'Whole World',
    'RSX': 'Russia',
    'EWL': 'Switzerland',
    'EWU': 'UK',
    'EWI': 'Italy',
    'EWP': 'Spain',
    'EWA': 'Australia',
    'AFK': 'Whole Africa',
    'EGPT': 'Egypt',
    'MCHI': 'China',
    'FXI': 'China Large Cap',
    'CQQQ': 'China Tech',
    'THD': 'Thailand',
    'EWY': 'South Korea',
    'EWM': 'Malaysia',
    'EWS': 'Singapore',
    'DAX': 'Germany',
    'EWC': 'Canada',
    'EWZ': 'Brazil',
    'EWW': 'Mexico',
    'ARGT': 'Argentina',
    'EPU': 'Peru',
    'INDA': 'India',
    'INDY': 'India 50',
    'EIDO': 'Indonesia',
    'JPXN': 'Japan, Nikkei 400',
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
    'ZB=F': 'Treasury Bond Futures'
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

  /// Main crypto currencies listed in yahoo finance
  static Map<String, String> cryptoCurrencies = {
    'BTC-USD': 'Bitcoin USD',
    'ETH-USD': 'Ethereum USD',
    'USDT-USD': 'Tether USD',
    'BNB-USD': 'Binance Coin USD',
    'USDC-USD': 'USD Coin USD',
    'HEX-USD': 'HEX USD',
    'XRP-USD': 'XRP USD',
    'SOL-USD': 'Solana USD',
    'LUNA1-USD': 'Terra USD',
    'ADA-USD': 'Cardano USD',
    'UST-USD': 'TerraUSD USD',
    'BUSD-USD': 'Binance USD USD',
    'DOGE-USD': 'Dogecoin USD',
    'AVAX-USD': 'Avalanche USD',
    'DOT-USD': 'Polkadot USD',
    'SHIB-USD': 'SHIBA INU USD',
    'WBTC-USD': 'Wrapped Bitcoin USD',
    'STETH-USD': 'Lido stETH USD',
    'MATIC-USD': 'Polygon USD',
    'DAI-USD': 'Dai USD',
    'NEAR-USD': 'NEAR Protocol USD',
    'WTRX-USD': 'Wrapped TRON USD',
    'TRX-USD': 'TRON USD',
    'CRO-USD': 'Crypto-com Coin USD',
    'LTC-USD': 'Litecoin USD',
    'BCH-USD': 'Bitcoin Cash USD',
    'LEO-USD': 'UNUS SED LEO USD',
    'LINK-USD': 'Chainlink USD',
    'FTT-USD': 'FTX Token USD',
    'ATOM-USD': 'Cosmos USD',
    'UNI1-USD': 'Uniswap USD',
    'ALGO-USD': 'Algorand USD',
    'APE3-USD': 'ApeCoin USD',
    'XLM-USD': 'Stellar USD',
    'YOUC-USD': 'yOUcash USD',
    'BTCB-USD': 'Bitcoin BEP2 USD',
    'XMR-USD': 'Monero USD',
    'ETC-USD': 'Ethereum Classic USD',
    'VET-USD': 'VeChain USD',
    'ICP-USD': 'Internet Computer USD',
    'HBAR-USD': 'Hedera USD',
    'FIL-USD': 'Filecoin USD',
    'MANA-USD': 'Decentraland USD',
    'EGLD-USD': 'Elrond USD',
    'FRAX-USD': 'Frax USD',
    'SAND-USD': 'The Sandbox USD',
    'THETA-USD': 'THETA USD',
    'TONCOIN-USD': 'Toncoin USD',
    'XTZ-USD': 'Tezos USD',
    'DFI-USD': 'DeFiChain USD',
    'RUNE-USD': 'THORChain USD',
    'CAKE-USD': 'PancakeSwap USD',
    'EOS-USD': 'EOS USD',
    'WBNB-USD': 'Wrapped BNB USD',
    'AAVE-USD': 'Aave USD',
    'FTM-USD': 'Fantom USD',
    'KLAY-USD': 'Klaytn USD',
    'GMT3-USD': 'Green Metaverse Token USD',
    'BTT-USD': 'BitTorrent USD',
    'AXS-USD': 'Axie Infinity USD',
    'HNT-USD': 'Helium USD',
    'KCS-USD': 'KuCoin Token USD',
    'ZEC-USD': 'Zcash USD',
    'FLOW-USD': 'Flow USD',
    'BTT2-USD': 'BitTorrent (new) USD',
    'WAVES-USD': 'Waves USD',
    'HBTC-USD': 'Huobi BTC USD',
    'GRT1-USD': 'The Graph USD',
    'CVX-USD': 'Convex Finance USD',
    'HT-USD': 'Huobi Token USD',
    'XCN1-USD': 'Chain USD',
    'MIOTA-USD': 'IOTA USD',
    'BSV-USD': 'Bitcoin SV USD',
    'MKR-USD': 'Maker USD',
    'XEC-USD': 'eCash USD',
    'TUSD-USD': 'TrueUSD USD',
    'NEO-USD': 'Neo USD',
    'STX-USD': 'Stacks USD',
    'NEXO-USD': 'Nexo USD',
    'QNT-USD': 'Quant USD',
    'KSM-USD': 'Kusama USD',
    'OSMO-USD': 'Osmosis USD',
    'OKB-USD': 'OKB USD',
    'CRV-USD': 'Curve DAO Token USD',
    'CHZ-USD': 'Chiliz USD',
    'CELO-USD': 'Celo USD',
    'ONE1-USD': 'Harmony USD',
    'GALA-USD': 'Gala USD',
    'LRC-USD': 'Loopring USD',
    'ENJ-USD': 'Enjin Coin USD',
    'DASH-USD': 'Dash USD',
    'USDP-USD': 'Pax Dollar USD',
    'ZIL-USD': 'Zilliqa USD',
    'USDN-USD': 'Neutrino USD USD',
    'BAT-USD': 'Basic Attention Token USD',
    'LDO-USD': 'Lido DAO Token USD',
    'MINA-USD': 'Mina USD',
    'AR-USD': 'Arweave USD',
    'XEM-USD': 'NEM USD',
    'XDC-USD': 'XDC Network USD',
  };

  //TODO fill with data from https://datahub-io/core/s-and-p-500-companies
  /// Some companies to make searching easier
  static Map<String, String> companies = {
    'MMM': '3M',
    'AOS': 'A- O- Smith',
    'ABT': 'Abbott Laboratories',
    'ABBV': 'AbbVie',
    'ABMD': 'Abiomed',
    'ACN': 'Accenture',
    'ATVI': 'Activision Blizzard',
    'ADM': 'ADM',
    'ADBE': 'Adobe',
    'AAP': 'Advance Auto Parts',
    'AMD': 'Advanced Micro Devices',
    'AES': 'AES Corp',
    'AFL': 'Aflac',
    'A': 'Agilent Technologies',
    'APD': 'Air Products & Chemicals',
    'AKAM': 'Akamai Technologies',
    'ALK': 'Alaska Air Group',
    'ALB': 'Albemarle Corporation',
    'ARE': 'Alexandria Real Estate Equities',
    'ALGN': 'Align Technology',
    'ALLE': 'Allegion',
    'LNT': 'Alliant Energy',
    'ALL': 'Allstate Corp',
    'GOOGL': 'Alphabet (Class A)',
    'GOOG': 'Alphabet (Class C)',
    'MO': 'Altria Group',
    'AMZN': 'Amazon',
    'AMCR': 'Amcor',
    'AEE': 'Ameren Corp',
    'AAL': 'American Airlines Group',
    'AEP': 'American Electric Power',
    'AXP': 'American Express',
    'AIG': 'American International Group',
    'AMT': 'American Tower',
    'AWK': 'American Water Works',
    'AMP': 'Ameriprise Financial',
    'ABC': 'AmerisourceBergen',
    'AME': 'Ametek',
    'AMGN': 'Amgen',
    'APH': 'Amphenol',
    'ADI': 'Analog Devices',
    'ANSS': 'Ansys',
    'ANTM': 'Anthem',
    'AON': 'Aon',
    'APA': 'APA Corporation',
    'AAPL': 'Apple',
    'AMAT': 'Applied Materials',
    'APTV': 'Aptiv',
    'ANET': 'Arista Networks',
    'AJG': 'Arthur J- Gallagher & Co-',
    'AIZ': 'Assurant',
    'T': 'AT&T',
    'ATO': 'Atmos Energy',
    'ADSK': 'Autodesk',
    'ADP': 'Automatic Data Processing',
    'AZO': 'AutoZone',
    'AVB': 'AvalonBay Communities',
    'AVY': 'Avery Dennison',
    'BKR': 'Baker Hughes',
    'BLL': 'Ball Corp',
    'BAC': 'Bank of America',
    'BBWI': 'Bath & Body Works Inc-',
    'BAX': 'Baxter International',
    'BDX': 'Becton Dickinson',
    'BRK-B': 'Berkshire Hathaway',
    'BBY': 'Best Buy',
    'BIO': 'Bio-Rad Laboratories',
    'TECH': 'Bio-Techne',
    'BIIB': 'Biogen',
    'BLK': 'BlackRock',
    'BK': 'BNY Mellon',
    'BA': 'Boeing',
    'BKNG': 'Booking Holdings',
    'BWA': 'BorgWarner',
    'BXP': 'Boston Properties',
    'BSX': 'Boston Scientific',
    'BMY': 'Bristol Myers Squibb',
    'AVGO': 'Broadcom',
    'BR': 'Broadridge Financial Solutions',
    'BRO': 'Brown & Brown',
    'BF-B': 'Brown–Forman',
    'CHRW': 'C- H- Robinson',
    'CDNS': 'Cadence Design Systems',
    'CZR': 'Caesars Entertainment',
    'CPB': 'Campbell Soup',
    'COF': 'Capital One Financial',
    'CAH': 'Cardinal Health',
    'KMX': 'CarMax',
    'CCL': 'Carnival Corporation',
    'CARR': 'Carrier Global',
    'CTLT': 'Catalent',
    'CAT': 'Caterpillar',
    'CBOE': 'Cboe Global Markets',
    'CBRE': 'CBRE',
    'CDW': 'CDW',
    'CE': 'Celanese',
    'CNC': 'Centene Corporation',
    'CNP': 'CenterPoint Energy',
    'CDAY': 'Ceridian',
    'CERN': 'Cerner',
    'CF': 'CF Industries',
    'CRL': 'Charles River Laboratories',
    'SCHW': 'Charles Schwab Corporation',
    'CHTR': 'Charter Communications',
    'CVX': 'Chevron Corporation',
    'CMG': 'Chipotle Mexican Grill',
    'CB': 'Chubb',
    'CHD': 'Church & Dwight',
    'CI': 'Cigna',
    'CINF': 'Cincinnati Financial',
    'CTAS': 'Cintas Corporation',
    'CSCO': 'Cisco Systems',
    'C': 'Citigroup',
    'CFG': 'Citizens Financial Group',
    'CTXS': 'Citrix Systems',
    'CLX': 'Clorox',
    'CME': 'CME Group',
    'CMS': 'CMS Energy',
    'KO': 'Coca-Cola Company',
    'CTSH': 'Cognizant Technology Solutions',
    'CL': 'Colgate-Palmolive',
    'CMCSA': 'Comcast',
    'CMA': 'Comerica',
    'CAG': 'Conagra Brands',
    'COP': 'ConocoPhillips',
    'ED': 'Consolidated Edison',
    'STZ': 'Constellation Brands',
    'CPRT': 'Copart',
    'GLW': 'Corning',
    'CTVA': 'Corteva',
    'COST': 'Costco',
    'CTRA': 'Coterra',
    'CCI': 'Crown Castle',
    'CSX': 'CSX',
    'CMI': 'Cummins',
    'CVS': 'CVS Health',
    'DHI': 'D- R- Horton',
    'DHR': 'Danaher Corporation',
    'DRI': 'Darden Restaurants',
    'DVA': 'DaVita',
    'DE': 'Deere & Co-',
    'DAL': 'Delta Air Lines',
    'XRAY': 'Dentsply Sirona',
    'DVN': 'Devon Energy',
    'DXCM': 'DexCom',
    'FANG': 'Diamondback Energy',
    'DLR': 'Digital Realty Trust',
    'DFS': 'Discover Financial Services',
    'DISCA': 'Discovery (Series A)',
    'DISCK': 'Discovery (Series C)',
    'DISH': 'Dish Network',
    'DG': 'Dollar General',
    'DLTR': 'Dollar Tree',
    'D': 'Dominion Energy',
    'DPZ': "Domino's Pizza",
    'DOV': 'Dover Corporation',
    'DOW': 'Dow',
    'DTE': 'DTE Energy',
    'DUK': 'Duke Energy',
    'DRE': 'Duke Realty Corp',
    'DD': 'DuPont',
    'DXC': 'DXC Technology',
    'EMN': 'Eastman Chemical',
    'ETN': 'Eaton Corporation',
    'EBAY': 'eBay',
    'ECL': 'Ecolab',
    'EIX': 'Edison International',
    'EW': 'Edwards Lifesciences',
    'EA': 'Electronic Arts',
    'LLY': 'Eli Lilly & Co',
    'EMR': 'Emerson Electric Company',
    'ENPH': 'Enphase Energy',
    'ETR': 'Entergy',
    'EOG': 'EOG Resources',
    'EFX': 'Equifax',
    'EQIX': 'Equinix',
    'EQR': 'Equity Residential',
    'ESS': 'Essex Property Trust',
    'EL': 'Estée Lauder Companies',
    'ETSY': 'Etsy',
    'RE': 'Everest Re',
    'EVRG': 'Evergy',
    'ES': 'Eversource Energy',
    'EXC': 'Exelon',
    'EXPE': 'Expedia Group',
    'EXPD': 'Expeditors',
    'EXR': 'Extra Space Storage',
    'XOM': 'ExxonMobil',
    'FFIV': 'F5 Networks',
    'FB': 'Facebook',
    'FAST': 'Fastenal',
    'FRT': 'Federal Realty Investment Trust',
    'FDX': 'FedEx',
    'FIS': 'Fidelity National Information Services',
    'FITB': 'Fifth Third Bancorp',
    'FRC': 'First Republic Bank',
    'FE': 'FirstEnergy',
    'FISV': 'Fiserv',
    'FLT': 'Fleetcor',
    'FMC': 'FMC Corporation',
    'F': 'Ford',
    'FTNT': 'Fortinet',
    'FTV': 'Fortive',
    'FBHS': 'Fortune Brands Home & Security',
    'FOXA': 'Fox Corporation (Class A)',
    'FOX': 'Fox Corporation (Class B)',
    'BEN': 'Franklin Resources',
    'FCX': 'Freeport-McMoRan',
    'GPS': 'Gap',
    'GRMN': 'Garmin',
    'IT': 'Gartner',
    'GNRC': 'Generac Holdings',
    'GD': 'General Dynamics',
    'GE': 'General Electric',
    'GIS': 'General Mills',
    'GM': 'General Motors',
    'GPC': 'Genuine Parts',
    'GILD': 'Gilead Sciences',
    'GPN': 'Global Payments',
    'GL': 'Globe Life',
    'GS': 'Goldman Sachs',
    'HAL': 'Halliburton',
    'HBI': 'Hanesbrands',
    'HAS': 'Hasbro',
    'HCA': 'HCA Healthcare',
    'PEAK': 'Healthpeak Properties',
    'HSIC': 'Henry Schein',
    'HES': 'Hess Corporation',
    'HPE': 'Hewlett Packard Enterprise',
    'HLT': 'Hilton Worldwide',
    'HOLX': 'Hologic',
    'HD': 'Home Depot',
    'HON': 'Honeywell',
    'HRL': 'Hormel',
    'HST': 'Host Hotels & Resorts',
    'HWM': 'Howmet Aerospace',
    'HPQ': 'HP',
    'HUM': 'Humana',
    'HBAN': 'Huntington Bancshares',
    'HII': 'Huntington Ingalls Industries',
    'IBM': 'IBM',
    'IEX': 'IDEX Corporation',
    'IDXX': 'Idexx Laboratories',
    'INFO': 'IHS Markit',
    'ITW': 'Illinois Tool Works',
    'ILMN': 'Illumina',
    'INCY': 'Incyte',
    'IR': 'Ingersoll Rand',
    'INTC': 'Intel',
    'ICE': 'Intercontinental Exchange',
    'IFF': 'International Flavors & Fragrances',
    'IP': 'International Paper',
    'IPG': 'Interpublic Group',
    'INTU': 'Intuit',
    'ISRG': 'Intuitive Surgical',
    'IVZ': 'Invesco',
    'IPGP': 'IPG Photonics',
    'IQV': 'IQVIA',
    'IRM': 'Iron Mountain',
    'JBHT': 'J- B- Hunt',
    'JKHY': 'Jack Henry & Associates',
    'J': 'Jacobs Engineering Group',
    'SJM': 'JM Smucker',
    'JNJ': 'Johnson & Johnson',
    'JCI': 'Johnson Controls',
    'JPM': 'JPMorgan Chase',
    'JNPR': 'Juniper Networks',
    'KSU': 'Kansas City Southern',
    'K': "Kellogg's",
    'KEY': 'KeyCorp',
    'KEYS': 'Keysight Technologies',
    'KMB': 'Kimberly-Clark',
    'KIM': 'Kimco Realty',
    'KMI': 'Kinder Morgan',
    'KLAC': 'KLA Corporation',
    'KHC': 'Kraft Heinz',
    'KR': 'Kroger',
    'LHX': 'L3Harris Technologies',
    'LH': 'LabCorp',
    'LRCX': 'Lam Research',
    'LW': 'Lamb Weston',
    'LVS': 'Las Vegas Sands',
    'LEG': 'Leggett & Platt',
    'LDOS': 'Leidos',
    'LEN': 'Lennar',
    'LNC': 'Lincoln National',
    'LIN': 'Linde',
    'LYV': 'Live Nation Entertainment',
    'LKQ': 'LKQ Corporation',
    'LMT': 'Lockheed Martin',
    'L': 'Loews Corporation',
    'LOW': "Lowe's",
    'LUMN': 'Lumen Technologies',
    'LYB': 'LyondellBasell',
    'MTB': 'M&T Bank',
    'MRO': 'Marathon Oil',
    'MPC': 'Marathon Petroleum',
    'MKTX': 'MarketAxess',
    'MAR': 'Marriott International',
    'MMC': 'Marsh & McLennan',
    'MLM': 'Martin Marietta Materials',
    'MAS': 'Masco',
    'MA': 'Mastercard',
    'MTCH': 'Match Group',
    'MKC': 'McCormick & Company',
    'MCD': "McDonald's",
    'MCK': 'McKesson Corporation',
    'MDT': 'Medtronic',
    'MRK': 'Merck & Co-',
    'MET': 'MetLife',
    'MTD': 'Mettler Toledo',
    'MGM': 'MGM Resorts International',
    'MCHP': 'Microchip Technology',
    'MU': 'Micron Technology',
    'MSFT': 'Microsoft',
    'MAA': 'Mid-America Apartments',
    'MRNA': 'Moderna',
    'MHK': 'Mohawk Industries',
    'TAP': 'Molson Coors Beverage Company',
    'MDLZ': 'Mondelez International',
    'MPWR': 'Monolithic Power Systems',
    'MNST': 'Monster Beverage',
    'MCO': "Moody's Corporation",
    'MS': 'Morgan Stanley',
    'MSI': 'Motorola Solutions',
    'MSCI': 'MSCI',
    'NDAQ': 'Nasdaq',
    'NTAP': 'NetApp',
    'NFLX': 'Netflix',
    'NWL': 'Newell Brands',
    'NEM': 'Newmont',
    'NWSA': 'News Corp (Class A)',
    'NWS': 'News Corp (Class B)',
    'NEE': 'NextEra Energy',
    'NLSN': 'Nielsen Holdings',
    'NKE': 'Nike',
    'NI': 'NiSource',
    'NSC': 'Norfolk Southern',
    'NTRS': 'Northern Trust',
    'NOC': 'Northrop Grumman',
    'NLOK': 'NortonLifeLock',
    'NCLH': 'Norwegian Cruise Line Holdings',
    'NRG': 'NRG Energy',
    'NUE': 'Nucor',
    'NVDA': 'Nvidia',
    'NVR': 'NVR',
    'NXPI': 'NXP',
    'ORLY': "O'Reilly Automotive",
    'OXY': 'Occidental Petroleum',
    'ODFL': 'Old Dominion Freight Line',
    'OMC': 'Omnicom Group',
    'OKE': 'Oneok',
    'ORCL': 'Oracle',
    'OGN': 'Organon & Co-',
    'OTIS': 'Otis Worldwide',
    'PCAR': 'Paccar',
    'PKG': 'Packaging Corporation of America',
    'PH': 'Parker-Hannifin',
    'PAYX': 'Paychex',
    'PAYC': 'Paycom',
    'PYPL': 'PayPal',
    'PENN': 'Penn National Gaming',
    'PNR': 'Pentair',
    'PBCT': "People's United Financial",
    'PEP': 'PepsiCo',
    'PKI': 'PerkinElmer',
    'PFE': 'Pfizer',
    'PM': 'Philip Morris International',
    'PSX': 'Phillips 66',
    'PNW': 'Pinnacle West Capital',
    'PXD': 'Pioneer Natural Resources',
    'PNC': 'PNC Financial Services',
    'POOL': 'Pool Corporation',
    'PPG': 'PPG Industries',
    'PPL': 'PPL',
    'PFG': 'Principal Financial Group',
    'PG': 'Procter & Gamble',
    'PGR': 'Progressive Corporation',
    'PLD': 'Prologis',
    'PRU': 'Prudential Financial',
    'PTC': 'PTC',
    'PEG': 'Public Service Enterprise Group',
    'PSA': 'Public Storage',
    'PHM': 'PulteGroup',
    'PVH': 'PVH',
    'QRVO': 'Qorvo',
    'QCOM': 'Qualcomm',
    'PWR': 'Quanta Services',
    'DGX': 'Quest Diagnostics',
    'RL': 'Ralph Lauren Corporation',
    'RJF': 'Raymond James Financial',
    'RTX': 'Raytheon Technologies',
    'O': 'Realty Income Corporation',
    'REG': 'Regency Centers',
    'REGN': 'Regeneron Pharmaceuticals',
    'RF': 'Regions Financial Corporation',
    'RSG': 'Republic Services',
    'RMD': 'ResMed',
    'RHI': 'Robert Half International',
    'ROK': 'Rockwell Automation',
    'ROL': 'Rollins',
    'ROP': 'Roper Technologies',
    'ROST': 'Ross Stores',
    'RCL': 'Royal Caribbean Group',
    'SPGI': 'S&P Global',
    'CRM': 'Salesforce',
    'SBAC': 'SBA Communications',
    'SLB': 'Schlumberger',
    'STX': 'Seagate Technology',
    'SEE': 'Sealed Air',
    'SRE': 'Sempra Energy',
    'NOW': 'ServiceNow',
    'SHW': 'Sherwin-Williams',
    'SPG': 'Simon Property Group',
    'SWKS': 'Skyworks Solutions',
    'SNA': 'Snap-on',
    'SO': 'Southern Company',
    'LUV': 'Southwest Airlines',
    'SWK': 'Stanley Black & Decker',
    'SBUX': 'Starbucks',
    'STT': 'State Street Corporation',
    'STE': 'Steris',
    'SYK': 'Stryker Corporation',
    'SIVB': 'SVB Financial',
    'SYF': 'Synchrony Financial',
    'SNPS': 'Synopsys',
    'SYY': 'Sysco',
    'TMUS': 'T-Mobile US',
    'TROW': 'T- Rowe Price',
    'TTWO': 'Take-Two Interactive',
    'TPR': 'Tapestry',
    'TGT': 'Target Corporation',
    'TEL': 'TE Connectivity',
    'TDY': 'Teledyne Technologies',
    'TFX': 'Teleflex',
    'TER': 'Teradyne',
    'TSLA': 'Tesla',
    'TXN': 'Texas Instruments',
    'TXT': 'Textron',
    'COO': 'The Cooper Companies',
    'HIG': 'The Hartford',
    'HSY': 'The Hershey Company',
    'MOS': 'The Mosaic Company',
    'TRV': 'The Travelers Companies',
    'DIS': 'The Walt Disney Company',
    'TMO': 'Thermo Fisher Scientific',
    'TJX': 'TJX Companies',
    'TSCO': 'Tractor Supply Company',
    'TT': 'Trane Technologies',
    'TDG': 'TransDigm Group',
    'TRMB': 'Trimble',
    'TFC': 'Truist Financial',
    'TWTR': 'Twitter',
    'TYL': 'Tyler Technologies',
    'TSN': 'Tyson Foods',
    'USB': 'U-S- Bancorp',
    'UDR': 'UDR',
    'ULTA': 'Ulta Beauty',
    'UAA': 'Under Armour (Class A)',
    'UA': 'Under Armour (Class C)',
    'UNP': 'Union Pacific',
    'UAL': 'United Airlines',
    'UPS': 'United Parcel Service',
    'URI': 'United Rentals',
    'UNH': 'UnitedHealth Group',
    'UHS': 'Universal Health Services',
    'VLO': 'Valero Energy',
    'VTR': 'Ventas',
    'VRSN': 'Verisign',
    'VRSK': 'Verisk Analytics',
    'VZ': 'Verizon Communications',
    'VRTX': 'Vertex Pharmaceuticals',
    'VFC': 'VF Corporation',
    'VIAC': 'ViacomCBS',
    'VTRS': 'Viatris',
    'V': 'Visa',
    'VNO': 'Vornado Realty Trust',
    'VMC': 'Vulcan Materials',
    'WRB': 'W- R- Berkley Corporation',
    'GWW': 'W- W- Grainger',
    'WAB': 'Wabtec',
    'WBA': 'Walgreens Boots Alliance',
    'WMT': 'Walmart',
    'WM': 'Waste Management',
    'WAT': 'Waters Corporation',
    'WEC': 'WEC Energy Group',
    'WFC': 'Wells Fargo',
    'WELL': 'Welltower',
    'WST': 'West Pharmaceutical Services',
    'WDC': 'Western Digital',
    'WU': 'Western Union',
    'WRK': 'WestRock',
    'WY': 'Weyerhaeuser',
    'WHR': 'Whirlpool Corporation',
    'WMB': 'Williams Companies',
    'WLTW': 'Willis Towers Watson',
    'WYNN': 'Wynn Resorts',
    'XEL': 'Xcel Energy',
    'XLNX': 'Xilinx',
    'XYL': 'Xylem',
    'YUM': 'Yum! Brands',
    'ZBRA': 'Zebra Technologies',
    'ZBH': 'Zimmer Biomet',
    'ZION': 'Zions Bancorp',
    'ZTS': 'Zoetis',
  };
}
