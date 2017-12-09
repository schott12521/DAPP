@tokens-list=-> new Array do
	* address:\0x8f8bf891529bb2ea3450695df75b0553e43bcd7b name:'Sample token' description:'ERC20 token for development'
	* address:\0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0 name:'EOS' description:'Super-puper thing'
	* address:\0x name:'Qtum'
	* address:\0x name:'OmiseGO'
	* address:\0x name:'MKR - Maker'
	* address:\0x name:'REP - Augur'
	* address:\0x name:'GOLEM (GNT)' 
	* address:\0x name:'TenXPay'
	* address:\0x name:'SNT - Status Network'
	* address:\0x name:'Kyber Network Crystal (KNC)'
	* address:\0x name:'DGD - Digix Global'
	* address:\0x name:'Bat - Basic Attention Token'
	* address:\0x name:'Decentraland'
	* address:\0x name:'ICONOMI'
	* address:\0x name:'FunFair'
	* address:\0x name:'0xProject (ZRX)'
	* address:\0x name:'Santiment (SAN)'
	* address:\0x name:'Gnosis (Gno)'
	* address:\0x name:'Monaco'
	* address:\0x name:'MetalPay'
	* address:\0x name:'Civic'
	* address:\0x name:'Storj'
	* address:\0x name:'Bancor Network'
	* address:\0x name:'Ethos (ETHOS)'
	* address:\0x name:'Edgeless'
	* address:\0x name:'SNGLS - SingularDTV'
	* address:\0x name:'Aragon Network'
	* address:\0x name:'Wings'
	* address:\0x name:'RLC - iEx.ec'
	* address:\0x name:'AirSwap'
	* address:\0x name:'Melon'
	* address:\0x name:'Cofound.it (CFI)'
	* address:\0x name:'Trustcoin - WeTrust'
	* address:\0x name:'FirstBlood'
	* address:\0x name:'Taas Fund'
	* address:\0x name:'district0x'
	* address:\0x name:'Numeraire'
	* address:\0x name:'Xaurum'
	* address:\0x name:'Humaniq'
	* address:\0x name:'Tokencard - Monolith'
	* address:\0x name:'Guppy - Matchpool'
	* address:\0x name:'TIME - ChronoBank'
	* address:\0x name:'AdToken'
	* address:\0x name:'SWT - Swarm City'
	* address:\0x name:'Etheroll'
	* address:\0x name:'NimiqNetwork'
	* address:\0x name:'Lunyr'
	* address:\0x name:'Bcap - Blockchain Capital'
	* address:\0x name:'Pluton - Plutus.it'
	* address:\0x name:'vSlice'	


@smart-contract-converter=-> 
	for item in tokens-list!
		if it == item.address => return item.name
	return \–––



