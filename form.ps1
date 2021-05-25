<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Form-hashi
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(211,207)
$Form.text                       = "Form"
$Form.TopMost                    = $false

$dbComboBox                      = New-Object system.Windows.Forms.ComboBox
$dbComboBox.text                 = "Select Database"
$dbComboBox.width                = 123
$dbComboBox.height               = 100
$dbComboBox.location             = New-Object System.Drawing.Point(43,39)
$dbComboBox.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

# Add the items in the dropdown list
@('Canon','Hp') | ForEach-Object {[void] $dbComboBox.Items.Add($_)}
# Select the default value
$dbComboBox.SelectedIndex       = 0


$schemaComboBox                  = New-Object system.Windows.Forms.ComboBox
$schemaComboBox.text             = "Select Schema"
$schemaComboBox.width            = 123
$schemaComboBox.height           = 100
$schemaComboBox.location         = New-Object System.Drawing.Point(43,88)
$schemaComboBox.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$passwordLabelBox                = New-Object system.Windows.Forms.Label
$passwordLabelBox.AutoSize       = $true
$passwordLabelBox.width          = 25
$passwordLabelBox.height         = 10
$passwordLabelBox.location       = New-Object System.Drawing.Point(101,140)
$passwordLabelBox.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Copy to clipboard"
$Button1.width                   = 126
$Button1.height                  = 33
$Button1.location                = New-Object System.Drawing.Point(42,132)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Button1.ForeColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#4a90e2")

$Form.controls.AddRange(@($dbComboBox,$schemaComboBox,$passwordLabelBox,$Button1))

$dbComboBox.Add_SelectedIndexChanged({ fetchSchema $this $_ })
$schemaComboBox.Add_SelectedIndexChanged({ getPassword $this $_ })
$Button1.Add_Click({ copyToClipboard })

function getPassword ($sender,$event) { }
function fetchSchema ($sender,$event) { }


#Write your logic code here
function fetchSchema() {
    
}

function getPassword() {
    
}
[void]$Form.ShowDialog()
