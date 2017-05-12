# @M = map

@SiteQ   =-> /^[\S]+\.[\S]+$/gi.test it
@IntQ    =-> /^[0-9\.]+$/gi.test it
@EthQ    =-> /^(0x)?[0-9a-zA-Z]{42}$/i.test it

@EmailQ  =-> /^[\S]+\@[\S]+\.[\S]+$/gi.test it

@date-now-arr =-> 
    new Date(Date.now!)
        |> String
        |> split ' '
        |> slice 1 4

@date-tomorrow-arr =-> inc-date-arr {date:Date.now!, inc:1}

@inc-date-arr =-> 
    date = new Date(Date.parse it.date)
    new Date(date.setDate(date.getDate() + (+it.inc-1)))
        |> String
        |> split ' '
        |> slice 1 4

@format-date =-> 
    "#{it?1||''} #{it?0||''} #{drop(2 it?2||'')}"

@today    =-> format-date date-now-arr!
@tomorrow =-> format-date date-tomorrow-arr!
@inc-date =-> format-date inc-date-arr it

@get-all-of =-> 
    rules_arr = []
    rules = state.get it
    for n of rules
        rule = rules[n]
        rule.id = n
        rules_arr.push rule
    rules_arr

@get-num-of =->
    arr = []
    els = state.get it
    for n of els
        arr.push n
    arr

@delete-year =-> slice 0 6 it

@get-id =->
    id = ''
    charset = union [48 to 57], [65 to 90],[97 to 122] 
    for i in [1 to 30] 
        pos = Math.floor(62*Math.random!)
        id += String.fromCharCode charset[pos]
    return String(id)

@validate-val-with =(o,test)-> 
    unless test o.val! => o.parent!addClass \validation-error else o.parent!removeClass \validation-error 

@push-to-state =->
    current = state.get &0
    current.push &1
    state.set &0, current


@lookup-and-append = (obj,cls) ~> Meteor.setTimeout((~> 
    if typeof obj != \undefined => $(cls).html(String(obj))
    else lookup-and-append(obj,cls); #console.log obj
    ), 30)


@lookup= (obj,func) ~> Meteor.setTimeout((~> 
    if typeof obj != \undefined => func(obj);
    else 
        state.set(\inc_lookup (state.get(\inc_lookup)||1)+1)
        console.log state.get(\inc_lookup)
        if state.get(\inc_lookup) > 20 => location.reload()
        lookup(obj,func)
        
    ), 30)


@conscb =-> 
    if &0 => console.log \err: &0
    if &1 => console.log \res: &1

@simple-cb =->
    if &0 => new Error &0
    if &1 => &1    

@state-int-to-str =-> switch it
    | 0=> 'no data'
    | 1=> 'waiting for tokens'
    | 2=> \cancelled
    | 3=> 'waiting for lender'
    | 4=> \funded
    | 5=> \default
    | 6=> \closed
    | _=> \----

@big-zero = \0x0000000000000000000000000000000000000000