abstract class CompaniesTickers {
  //TODO fill with data from https://datahub.io/core/s-and-p-500-companies
  /// Some companies to make searching easier
  static Map<String, String> sp500 = {
    'AAPL': 'Apple Inc.',
    'MSFT': 'Microsoft Corp',
    'AMZN': 'Amazon.com Inc',
    'NVDA': 'Nvidia Corp',
    'GOOGL': 'Alphabet Inc. Class A',
    'META': 'Meta Platforms, Inc. Class A',
    'TSLA': 'Tesla, Inc.',
    'GOOG': 'Alphabet Inc. Class C',
    'BRK-B': 'Berkshire Hathaway Class B',
    'UNH': 'Unitedhealth Group Incorporated',
    'AVGO': 'Broadcom Inc.',
    'JPM': 'Jpmorgan Chase & Co.',
    'LLY': 'Eli Lilly & Co.',
    'V': 'Visa Inc.',
    'XOM': 'Exxon Mobil Corporation',
    'JNJ': 'Johnson & Johnson',
    'HD': 'Home Depot, Inc.',
    'MA': 'Mastercard Incorporated',
    'PG': 'Procter & Gamble Company',
    'COST': 'Costco Wholesale Corp',
    'ABBV': 'Abbvie Inc.',
    'MRK': 'Merck & Co., Inc.',
    'ADBE': 'Adobe Inc.',
    'CVX': 'Chevron Corporation',
    'CRM': 'Salesforce, Inc.',
    'BAC': 'Bank of America Corporation',
    'PEP': 'Pepsico, Inc.',
    'KO': 'Coca-Cola Company',
    'AMD': 'Advanced Micro Devices',
    'WMT': 'Walmart Inc.',
    'ACN': 'Accenture Plc',
    'MCD': "Mcdonald's Corporation",
    'NFLX': 'Netflix Inc',
    'CSCO': 'Cisco Systems, Inc.',
    'TMO': 'Thermo Fisher Scientific, Inc.',
    'LIN': 'Linde Plc',
    'INTC': 'Intel Corp',
    'ABT': 'Abbott Laboratories',
    'WFC': 'Wells Fargo & Co.',
    'CMCSA': 'Comcast Corp',
    'DIS': 'The Walt Disney Company',
    'INTU': 'Intuit Inc',
    'VZ': 'Verizon Communications',
    'QCOM': 'Qualcomm Inc',
    'ORCL': 'Oracle Corp',
    'TXN': 'Texas Instruments Incorporated',
    'DHR': 'Danaher Corporation',
    'IBM': 'International Business Machines Corporation',
    'NKE': 'Nike, Inc.',
    'UNP': 'Union Pacific Corp.',
    'AMGN': 'Amgen Inc',
    'PFE': 'Pfizer Inc.',
    'PM': 'Philip Morris International Inc.',
    'CAT': 'Caterpillar Inc.',
    'BA': 'Boeing Company',
    'SPGI': 'S&p Global Inc.',
    'NOW': 'Servicenow, Inc.',
    'COP': 'Conocophillips',
    'AMAT': 'Applied Materials Inc',
    'HON': 'Honeywell International, Inc.',
    'LOW': "Lowe's Companies Inc.",
    'GE': 'General Electric Company',
    'NEE': 'Nextra Energy, Inc.',
    'GS': 'Goldman Sachs Group Inc.',
    'PLD': 'Prologis, Inc.',
    'BKNG': 'Booking Holdings Inc.',
    'RTX': 'Rtx Corporation',
    'T': 'At&t Inc.',
    'UPS': 'United Parcel Service, Inc. Class B',
    'MS': 'Morgan Stanley',
    'ISRG': 'Intuitive Surgical Inc.',
    'BLK': 'Blackrock, Inc.',
    'ELV': 'Elevance Health, Inc.',
    'SBUX': 'Starbucks Corp',
    'MDT': 'Medtronic Plc',
    'BMY': 'Bristol-Myers Squibb Co.',
    'DE': 'Deere & Company',
    'SCHW': 'The Charles Schwab Corporation',
    'VRTX': 'Vertex Pharmaceuticals Inc',
    'AXP': 'American Express Company',
    'TJX': 'Tjx Companies, Inc.',
    'LRCX': 'Lam Research Corp',
    'GILD': 'Gilead Sciences Inc',
    'SYK': 'Stryker Corporation',
    'ADI': 'Analog Devices, Inc.',
    'LMT': 'Lockheed Martin Corp.',
    'AMT': 'American Tower Corporation',
    'ADP': 'Automatic Data Processing',
    'C': 'Citigroup Inc.',
    'MDLZ': 'Mondelez International, Inc. Class A',
    'CVS': 'Cvs Health Corporation',
    'ETN': 'Eaton Corporation, Plcs',
    'MMC': 'Marsh & Mclennan Companies, Inc.',
    'REGN': 'Regeneron Pharmaceuticals Inc',
    'ZTS': 'Zoetis Inc.',
    'PANW': 'Palo Alto Networks, Inc.',
    'BX': 'Blackstone Inc.',
    'CB': 'Chubb Limited',
    'MU': 'Micron Technology, Inc.',
    'PGR': 'Progressive Corporation',
    'CI': 'The Cigna Group',
    'SNPS': 'Synopsys Inc',
    'FI': 'Fiserv, Inc.',
    'BSX': 'Boston Scientific Corp.',
    'TMUS': 'T-Mobile Us, Inc.',
    'KLAC': 'Kla Corporation',
    'SO': 'The Southern Company',
    'DUK': 'Duke Energy Corporation',
    'CME': 'Cme Group Inc.',
    'EQIX': 'Equinix, Inc. Reit',
    'MO': 'Altria Group, Inc.',
    'SLB': 'Schlumberger Limited',
    'CDNS': 'Cadence Design Systems',
    'SHW': 'The Sherwin-Williams Company',
    'ITW': 'Illinois Tool Works Inc.',
    'USB': 'U.S. Bancorp',
    'ICE': 'Intercontinental Exchange  Inc.',
    'EOG': 'Eog Resources, Inc.',
    'BDX': 'Becton, Dickinson and Co.',
    'PYPL': 'Paypal Holdings, Inc.',
    'CSX': 'Csx Corporation',
    'NOC': 'Northrop Grumman Corp.',
    'WM': 'Waste Management, Inc.',
    'TGT': 'Target Corporation',
    'FDX': 'Fedex Corporation',
    'AON': 'Aon Plc Class A',
    'CL': 'Colgate-Palmolive Company',
    'ABNB': 'Airbnb, Inc. Class A',
    'CMG': 'Chipotle Mexican Grill, Inc.',
    'MCO': "Moody's Corporation",
    'PNC': 'Pnc Financial Services Group',
    'MPC': 'Marathon Petroleum Corporation',
    'FCX': 'Freeport-Mcmoran Inc.',
    'APD': 'Air Products & Chemicals, Inc.',
    'NXPI': 'Nxp Semiconductors N.v.',
    'MCK': 'Mckesson Corporation',
    'MMM': '3m Company',
    'APH': 'Amphenol Corporation',
    'PH': 'Parker-Hannifin Corporation',
    'HUM': 'Humana Inc.',
    'PSX': 'Phillips 66',
    'ANET': 'Arista Networks',
    'ORLY': "O'reilly Automotive, Inc.",
    'ROP': 'Roper Technologies, Inc.',
    'GD': 'General Dynamics Corporation',
    'LULU': 'Lululemon Athletica Inc.',
    'HCA': 'Hca Healthcare, Inc.',
    'EMR': 'Emerson Electric Co.',
    'MAR': 'Marriot International Class A',
    'TT': 'Trane Technologies Plc',
    'TDG': 'Transdigm Group Incorporated',
    'PXD': 'Pioneer Natural Resource Co.',
    'NSC': 'Norfolk Southern Corp.',
    'MSI': 'Motorola Solutions, Inc.',
    'ADSK': 'Autodesk Inc',
    'WELL': 'Welltower Inc.',
    'MCHP': 'Microchip Technology Inc',
    'PCAR': 'Paccar Inc',
    'TFC': 'Truist Financial Corporation',
    'ECL': 'Ecolab, Inc.',
    'GM': 'General Motors Company',
    'CCI': 'Crown Castle Inc.',
    'COF': 'Capital One Financial',
    'CARR': 'Carrier Global Corporation',
    'AJG': 'Arthur J. Gallagher & Co.',
    'CTAS': 'Cintas Corp',
    'SRE': 'Sempra',
    'AZO': 'Autozone, Inc.',
    'SPG': 'Simon Property Group, Inc.',
    'DXCM': 'Dexcom, Inc.',
    'F': 'Ford Motor Company',
    'NEM': 'Newmont Corporation',
    'AIG': 'American International Group, Inc.',
    'EW': 'Edwards Lifesciences Corp',
    'DHI': 'D.R. Horton Inc.',
    'HLT': 'Hilton Worldwide Holdings Inc.',
    'PSA': 'Public Storage',
    'IDXX': 'Idexx Laboratories Inc',
    'ROST': 'Ross Stores Inc',
    'VLO': 'Valero Energy Corporation',
    'TEL': 'Te Connectivity Ltd',
    'AFL': 'Aflac Inc.',
    'MSCI': 'Msci, Inc.',
    'AEP': 'American Electric Power Company, Inc.',
    'CPRT': 'Copart Inc',
    'NUE': 'Nucor Corporation',
    'MET': 'Metlife, Inc.',
    'IQV': 'Iqvia Holdings Inc.',
    'WMB': 'Williams Companies Inc.',
    'TRV': 'The Travelers Companies, Inc.',
    'MNST': 'Monster Beverage Corporation',
    'D': 'Dominion Energy, Inc',
    'O': 'Realty Income Corporation',
    'ADM': 'Archer Daniels Midland Company',
    'CNC': 'Centene Corporation',
    'KMB': 'Kimberly-Clark Corp.',
    'A': 'Agilent Technologies Inc.',
    'PAYX': 'Paychex Inc',
    'DLR': 'Digital Realty Trust, Inc.',
    'BK': 'Bank of New York Mellon Corporation',
    'OKE': 'Oneok, Inc.',
    'HES': 'Hess Corporation',
    'LEN': 'Lennar Corporation Class A',
    'CHTR': 'Charter Comm Inc Del Cl a',
    'LHX': 'L3harris Technologies, Inc.',
    'AMP': 'Ameriprise Financial, Inc.',
    'OXY': 'Occidental Petroleum Corporation',
    'URI': 'United Rentals, Inc.',
    'STZ': 'Constellation Brands, Inc.',
    'GIS': 'General Mills, Inc.',
    'PRU': 'Prudential Financial, Inc.',
    'DOW': 'Dow Inc.',
    'AME': 'Ametek, Inc.',
    'EXC': 'Exelon Corporation',
    'CTSH': 'Cognizant Technology Solutions',
    'SYY': 'Sysco Corporation',
    'PCG': 'Pg&e Corporation',
    'OTIS': 'Otis Worldwide Corporation',
    'ON': 'On Semiconductor Corp',
    'CEG': 'Constellation Energy Corporation',
    'BIIB': 'Biogen Inc.',
    'FTNT': 'Fortinet, Inc.',
    'GWW': 'W.W. Grainger, Inc.',
    'YUM': 'Yum! Brands, Inc.',
    'FAST': 'Fastenal Co',
    'JCI': 'Johnson Controls International Plc',
    'ALL': 'The Allstate Corporation',
    'KVUE': 'Kenvue Inc.',
    'CSGP': 'Costar Group Inc',
    'IT': 'Gartner, Inc.',
    'FIS': 'Fidelity National Information Services, Inc.',
    'CMI': 'Cummins Inc.',
    'ROK': 'Rockwell Automation, Inc.',
    'PPG': 'Ppg Industries, Inc.',
    'EA': 'Electronic Arts Inc',
    'KMI': 'Kinder Morgan, Inc.',
    'XEL': 'Xcel Energy, Inc.',
    'ODFL': 'Old Dominion Freight Line',
    'VRSK': 'Verisk Analytics, Inc.',
    'EL': 'The Estee Lauder Companies Inc. Class A',
    'DD': 'Dupont De Nemours, Inc.',
    'BKR': 'Baker Hughes Company',
    'COR': 'Cencora, Inc.',
    'RSG': 'Republic Services Inc.',
    'CTVA': 'Corteva, Inc.',
    'GPN': 'Global Payments, Inc.',
    'EXR': 'Extra Space Storage, Inc.',
    'KDP': 'Keurig Dr Pepper Inc.',
    'HAL': 'Halliburton Company',
    'VICI': 'Vici Properties Inc.',
    'ED': 'Consolidated Edison, Inc.',
    'PEG': 'Public Service Enterprise Group Incorporated',
    'PWR': 'Quanta Services, Inc.',
    'MLM': 'Martin Marietta Materials',
    'IR': 'Ingersoll Rand Inc.',
    'MPWR': 'Monolithic Power Systems, Inc.',
    'EFX': 'Equifax, Incorporated',
    'VMC': 'Vulcan Materials Company',
    'GEHC': 'Ge Healthcare Technologies Inc.',
    'CDW': 'Cdw Corporation',
    'KHC': 'The Kraft Heinz Company',
    'DVN': 'Devon Energy Corporation',
    'DG': 'Dollar General Corp.',
    'RCL': 'Royal Caribbean Group',
    'KR': 'The Kroger Co.',
    'MRNA': 'Moderna, Inc.',
    'KEYS': 'Keysight Technologies, Inc.',
    'CBRE': 'Cbre Group, Inc.',
    'FICO': 'Fair Isaac Corporation',
    'HSY': 'The Hershey Company',
    'WBD': 'Warner Bros. Discovery, Inc. Series a',
    'ACGL': 'Arch Capital Group Ltd',
    'FANG': 'Diamondback Energy, Inc.',
    'DAL': 'Delta Air Lines, Inc.',
    'SBAC': 'Sba Communications Corp',
    'DLTR': 'Dollar Tree Inc.',
    'DFS': 'Discover Financial Services',
    'EIX': 'Edison International',
    'AVB': 'Avalonbay Communities, Inc.',
    'HPQ': 'Hp Inc.',
    'MTD': 'Mettler-Toledo International',
    'WEC': 'Wec Energy Group, Inc.',
    'XYL': 'Xylem Inc',
    'WST': 'West Pharmaceutical Services, Inc.',
    'CAH': 'Cardinal Health, Inc.',
    'AWK': 'American Water Works Company, Inc',
    'TTWO': 'Take-Two Interactive Software Inc',
    'FTV': 'Fortive Corporation',
    'ANSS': 'Ansys Inc',
    'RMD': 'Resmed Inc.',
    'APTV': 'Aptiv Plc',
    'STT': 'State Street Corporation',
    'WTW': 'Willis Towers Watson Public Limited Companys',
    'WY': 'Weyerhaeuser Company',
    'ZBH': 'Zimmer Biomet Holdings, Inc.',
    'ULTA': 'Ulta Beauty, Inc.',
    'HIG': 'The Hartford Financial Services Group, Inc.',
    'TSCO': 'Tractor Supply Co',
    'TROW': 'T Rowe Price Group Inc',
    'MTB': 'M&t Bank Corp.',
    'LYB': 'Lyondellbasell Industries N.v. Class A',
    'FITB': 'Fifth Third Bancorp',
    'GLW': 'Corning Incorporated',
    'PHM': 'Pultegroup, Inc.',
    'DTE': 'Dte Energy Company',
    'BR': 'Broadridge Financial Solutions Inc',
    'EBAY': 'Ebay Inc',
    'NVR': 'Nvr, Inc.',
    'CHD': 'Church & Dwight Co., Inc.',
    'HPE': 'Hewlett Packard Enterprise Company',
    'ES': 'Eversource Energy',
    'ETR': 'Entergy Corporation',
    'WAB': 'Wabtec Inc.',
    'MOH': 'Molina Healthcare, Inc.',
    'DOV': 'Dover Corporation',
    'EQR': 'Equity Residential',
    'ARE': 'Alexandria Real Estate Equities, Inc.',
    'RJF': 'Raymond James Financial, Inc.',
    'STE': 'Steris Plc',
    'ILMN': 'Illumina Inc',
    'HWM': 'Howmet Aerospace Inc.',
    'IFF': 'International Flavors & Fragrances Inc.',
    'PTC': 'Ptc, Inc',
    'INVH': 'Invitation Homes Inc.',
    'VTR': 'Ventas, Inc.',
    'EXPE': 'Expedia Group, Inc.',
    'TDY': 'Teledyne Technologies Incorporated',
    'FLT': 'Fleetcor Technologies, Inc.',
    'IRM': 'Iron Mountain Inc.',
    'PPL': 'Ppl Corporation',
    'LH': 'Laboratory Corporation of America Holdings',
    'DRI': 'Darden Restaurants, Inc.',
    'BAX': 'Baxter International Inc.',
    'GPC': 'Genuine Parts Company',
    'FE': 'Firstenergy Corp.',
    'AEE': 'Ameren Corporation',
    'CTRA': 'Coterra Energy Inc.',
    'TRGP': 'Targa Resources Corp.',
    'GRMN': 'Garmin Ltd',
    'WAT': 'Waters Corp',
    'NDAQ': 'Nasdaq, Inc.',
    'VRSN': 'Verisign Inc',
    'CCL': 'Carnival Corporation',
    'NTAP': 'Netapp, Inc',
    'CNP': 'Centerpoint Energy, Inc.',
    'HBAN': 'Huntington Bancshares Inc',
    'STLD': 'Steel Dynamics Inc',
    'BALL': 'Ball Corporation',
    'RF': 'Regions Financial Corp.',
    'ALGN': 'Align Technology Inc',
    'EXPD': 'Expeditors International of Washington, Inc.',
    'CBOE': 'Cboe Global Markets, Inc.',
    'COO': 'The Cooper Companies, Inc.',
    'SWKS': 'Skyworks Solutions Inc',
    'WBA': 'Walgreens Boots Alliance, Inc',
    'AKAM': 'Akamai Technologies Inc',
    'LVS': 'Las Vegas Sands Corp.',
    'AXON': 'Axon Enterprise, Inc.',
    'NTRS': 'Northern Trust Corp',
    'PFG': 'Principal Financial Group, Inc.',
    'LUV': 'Southwest Airlines Co.',
    'CLX': 'Clorox Company',
    'HUBB': 'Hubbell Incorporated',
    'HOLX': 'Hologic Inc',
    'VLTO': 'Veralto Corporation',
    'FDS': 'Factset Research Systems',
    'CMS': 'Cms Energy Corporation',
    'ATO': 'Atmos Energy Corporation',
    'MKC': 'Mccormick & Company, Incorporated Non-Vtg Cs',
    'ALB': 'Albemarle Corporation',
    'TYL': 'Tyler Technologies, Inc.',
    'OMC': 'Omnicom Group Inc.',
    'BRO': 'Brown & Brown, Inc.',
    'FSLR': 'First Solar, Inc.',
    'EPAM': 'Epam Systems, Inc.',
    'JBHT': 'Jb Hunt Transport Services Inc',
    'CINF': 'Cincinnati Financial Corp',
    'STX': 'Seagate Technology Holdings Plcs',
    'ENPH': 'Enphase Energy, Inc.',
    'WDC': 'Western Digital Corp.',
    'J': 'Jacobs Solutions Inc.',
    'TER': 'Teradyne, Inc.',
    'IEX': 'Idex Corporation',
    'AVY': 'Avery Dennison Corp.',
    'MAA': 'Mid-America Apartment Communities, Inc.',
    'ESS': 'Essex Property Trust, Inc',
    'CFG': 'Citizens Financial Group, Inc.',
    'BG': 'Bunge Limited',
    'SYF': 'Synchrony Financial',
    'TXT': 'Textron, Inc.',
    'SWK': 'Stanley Black & Decker, Inc.',
    'MAS': 'Masco Corporation',
    'EG': 'Everest Group, Ltd.',
    'POOL': 'Pool Corporation',
    'SNA': 'Snap-on Incorporated',
    'DGX': 'Quest Diagnostics Inc.',
    'CE': 'Celanese Corporation',
    'BBY': 'Best Buy Company, Inc.',
    'TSN': 'Tyson Foods, Inc.',
    'PKG': 'Packaging Corp of America',
    'LW': 'Lamb Weston Holdings, Inc.',
    'CF': 'Cf Industries Holding, Inc.',
    'MRO': 'Marathon Oil Corporation',
    'LDOS': 'Leidos Holdings, Inc.',
    'K': 'Kellanova',
    'PODD': 'Insulet Corporation',
    'WRB': 'W.R. Berkley Corporation',
    'AMCR': 'Amcor Plcs',
    'UAL': 'United Airlines Holdings, Inc.',
    'CAG': 'Conagra Brands, Inc.',
    'DPZ': "Domino's Pizza Inc.",
    'EQT': 'Eqt Corp',
    'ZBRA': 'Zebra Technologies Corporation',
    'HST': 'Host Hotels & Resorts, Inc.',
    'KIM': 'Kimco Realty Corp.',
    'KEY': 'Keycorp',
    'NDSN': 'Nordson Corp',
    'LYV': 'Live Nation Entertainment Inc.',
    'AES': 'Aes Corporation',
    'LNT': 'Alliant Energy Corporation',
    'IP': 'International Paper Co.',
    'GEN': 'Gen Digital Inc.',
    'TRMB': 'Trimble Inc.',
    'SJM': 'The J.M. Smucker Company',
    'L': 'Loews Corporation',
    'IPG': 'The Interpublic Group of Companies, Inc.',
    'RVTY': 'Revvity, Inc.',
    'MGM': 'Mgm Resorts International',
    'LKQ': 'Lkq Corporation',
    'VTRS': 'Viatris Inc.',
    'MOS': 'The Mosaic Company',
    'EVRG': 'Evergy, Inc.',
    'JKHY': 'Henry (Jack) & Associates',
    'TFX': 'Teleflex Incorporated',
    'ROL': 'Rollins, Inc.',
    'KMX': 'Carmax Inc.',
    'INCY': 'Incyte Genomics Inc',
    'PNR': 'Pentair Plc',
    'TECH': 'Bio-Techne Corp.',
    'TAP': 'Molson Coors Beverage Company Class B',
    'CRL': 'Charles River Laboratories International, Inc.',
    'UDR': 'Udr, Inc.',
    'REG': 'Regency Centers Corporation',
    'NRG': 'Nrg Energy, Inc.',
    'PEAK': 'Healthpeak Properties, Inc.',
    'QRVO': 'Qorvo, Inc.',
    'APA': 'Apa Corporation',
    'WRK': 'Westrock Company',
    'CPT': 'Camden Property Trust',
    'NI': 'Nisource Inc.',
    'GL': 'Globe Life Inc.',
    'MKTX': 'Marketaxess Holdings Inc.',
    'CDAY': 'Ceridian Hcm Holding',
    'BF-B': 'Brown-Forman Corporation Class B',
    'EMN': 'Eastman Chemical Company',
    'FFIV': 'F5, Inc.',
    'ALLE': 'Allegion Public Limited Company',
    'CZR': 'Caesars Entertainment, Inc.',
    'BXP': 'Boston Properties, Inc.',
    'ETSY': 'Etsy, Inc.',
    'HII': 'Huntington Ingalls Industries, Inc.',
    'AOS': 'A.O. Smith Corporation',
    'PAYC': 'Paycom Software, Inc.',
    'CHRW': 'C.H. Robinson Worldwide, Inc.',
    'HSIC': 'Henry Schein Inc',
    'MTCH': 'Match Group, Inc',
    'AAL': 'American Airlines Group Inc.',
    'JNPR': 'Juniper Networks Inc',
    'BBWI': 'Bath & Body Works, Inc.',
    'UHS': 'Universal Health Services, Inc. Class B',
    'RHI': 'Robert Half Inc.',
    'HRL': 'Hormel Foods Corporation',
    'NWSA': 'News Corporation Class A',
    'CPB': 'Campbell Soup Company',
    'AIZ': 'Assurant, Inc.',
    'WYNN': 'Wynn Resorts Ltd',
    'TPR': 'Tapestry, Inc.',
    'NCLH': 'Norwegian Cruise Line Holdings Ltd.s',
    'BWA': 'Borgwarner Inc.',
    'BEN': 'Franklin Resources, Inc.',
    'PNW': 'Pinnacle West Capital Corporation',
    'PARA': 'Paramount Global Class B',
    'GNRC': 'Generac Holdings Inc',
    'IVZ': 'Invesco Ltd',
    'FRT': 'Federal Realty Investment Trust',
    'FOXA': 'Fox Corporation Class A',
    'FMC': 'Fmc Corporation',
    'CTLT': 'Catalent, Inc.',
    'CMA': 'Comerica Incorporated',
    'XRAY': 'Dentsply Sirona Inc.',
    'ZION': 'Zions Bancorporation N.a.',
    'VFC': 'V.F. Corporation',
    'WHR': 'Whirlpool Corp.',
    'HAS': 'Hasbro, Inc.',
    'BIO': 'Bio-Rad Laboratories, Inc.Class A',
    'DVA': 'Davita Inc.',
    'RL': 'Ralph Lauren Corporation',
    'MHK': 'Mohawk Industries, Inc.',
    'SEDG': 'Solaredge Technologies, Inc.',
    'SEE': 'Sealed Air Corp.',
    'ALK': 'Alaska Air Group, Inc.',
    'FOX': 'Fox Corporation Class B',
    'NWS': 'News Corporation Class B'
  };
}