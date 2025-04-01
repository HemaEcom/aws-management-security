# Microsoft Defender InSpec Controls

control 'microsoft_defender_windows' do
  only_if('OS is Windows') { os.windows? }
  impact 1.0
  title 'Ensure Microsoft Defender is Installed and Running on Windows'
  desc 'Verifies Microsoft Defender status on Windows by checking service state and protection status in a single check'

  describe 'Microsoft Defender Status' do
    subject do
      service_status = service('WinDefend').installed? && service('WinDefend').running?
      protection_status = command('Get-MpComputerStatus').stdout.match?(/AMServiceEnabled\s+: True/)
      service_status && protection_status
    end
    it { should eq true }
  end
end

control 'microsoft_defender_linux' do
  only_if('OS is Linux') { os.linux? }
  impact 1.0
  title 'Ensure Microsoft Defender is Installed and Running on Linux'
  desc 'Verifies Microsoft Defender status on Linux by checking service and health status in a single check'

  describe 'Microsoft Defender Status' do
    subject do
      service_running = command('systemctl status mdatp.service').stdout.match?(/active \(running\)/)
      health_status = command('mdatp health').stdout.match?(/healthy/)
      service_running && health_status
    end
    it { should eq true }
  end
end
