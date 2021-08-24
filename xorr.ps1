$enc = [System.Text.Encoding]::UTF8
$xorkey = $enc.GetBytes("guesswho")
$path = 'xxx'
$byteString = [System.IO.File]::ReadAllBytes($path)
$xordData = $(for ($i = 0; $i -lt $byteString.length; ) {
        for ($j = 0; $j -lt $xorkey.length; $j++) {
            $byteString[$i] -bxor $xorkey[$j]
            $i++
            if ($i -ge $byteString.Length) {
                $j = $xorkey.length
            }
        }
    })
	
#Set-Content 'C:\Users\cas_it\Desktop\Defender_exclusion\Pview_xord.txt' -Value $xordData -Encoding Byte
#[io.file]::WriteAllBytes('Pview_dexord.txt',$xordData)

[System.Text.Encoding]::UTF8.GetString($xordData)|Out-String