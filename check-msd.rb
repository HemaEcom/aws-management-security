# Microsoft Defender InSpec Control

control 'microsoft_defender_running' do
  impact 1.0
  title 'Check if Microsoft Defender is installed and running'
  desc 'Ensure Microsoft Defender is installed and running on both Linux and Windows platforms.'
  
  # Check for Microsoft Defender on Windows
  if os.windows?
    describe service('WinDefend') do
      it { should be_installed }
      it { should be_running }
    end
  # Check for Microsoft Defender on Linux
  elsif os.linux?
    describe command('systemctl status mdatp.service') do
      its('stdout') { should match(/active \(running\)/) }
    end
  end
end
