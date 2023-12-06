import subprocess
import sys

def run_terraform_command(command):
    try:
        subprocess.run(command, check=True, shell=True)
    except subprocess.CalledProcessError as e:
        print(f"Error running Terraform command: {e}")
        sys.exit(1)

def main():
    init_command = "terraform init"
    run_terraform_command(init_command)
    apply_command = "terraform apply --auto-approve"
    run_terraform_command(apply_command)
    destroy_command = "terraform destroy --auto-approve"
    run_terraform_command(destroy_command)

if __name__ == "__main__":
    main()
