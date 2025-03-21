## Microsoft Defender InSpec Control

The `check-msd.rb` script is an InSpec control that checks if Microsoft Defender is installed and running on both Linux and Windows platforms.

### Details

- **Control Name**: `microsoft_defender_running`
- **Impact**: 1.0
- **Title**: Check if Microsoft Defender is installed and running
- **Description**: Ensures Microsoft Defender is installed and running on both Linux and Windows platforms.

### Platform-Specific Checks

- **Windows**:
  - Checks if the `WinDefend` service is installed and running.
  - Uses the `service` resource to verify the status of Microsoft Defender.

- **Linux**:
  - Checks if the `mdatp.service` is active and running.
  - Uses the `command` resource to verify the status of Microsoft Defender.

### Usage

To run this control, execute the following command:

```sh
inspec exec check-msd.rb
```

Ensure that InSpec is installed and properly configured on your system before running the script.
