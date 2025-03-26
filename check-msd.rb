# Microsoft Defender InSpec Control

control 'microsoft_defender' do
  impact 1.0
  title 'Ensure Microsoft Defender is Installed and Running'
  desc 'This control checks if Microsoft Defender is installed and running on both Linux and Windows platforms. It ensures that the security software is active and protecting the system.'

  # Check for Microsoft Defender on Windows
  if os.windows?
    describe service('WinDefend') do
      it { should be_installed }
      it { should be_running }
    end
    describe command('Get-MpComputerStatus') do
      its('stdout') { should match(/AMServiceEnabled\s+: True/) }
    end
  # Check for Microsoft Defender on Linux
  elsif os.linux?
    describe command('systemctl status mdatp.service') do
      its('stdout') { should match(/active \(running\)/) }
    end
    describe command('mdatp health') do
      its('stdout') { should match(/healthy/) }
    end
  end
end
