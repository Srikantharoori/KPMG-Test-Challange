$Obj= ConvertFrom-Json '{ "A": "x", "B": {"C": "y"} }'
# Or simply create the object:
# $Obj= @{ A = "x"; B = @{C = "y"} }
$Key = "B.C"
$Value = "Some Value"
$Obj.$Key = $Value


# Functions
function GetValue($object, $key)
{
    $p1,$p2 = $key.Split(".")
    if($p2) { return GetValue -object $object.$p1 -key $p2 }
    else { return $object.$p1 }
}
function SetValue($object, $key, $Value)
{
    $p1,$p2 = $key.Split(".")
    if($p2) { SetValue -object $object.$p1 -key $p2 -Value $Value }
    else { $object.$p1 = $Value }
}