import os
import subprocess
from github import Github

def get_branch_status():
    try:
        result = subprocess.run(['git', 'branch', '-vv'], capture_output=True, text=True, check=True)
        branches = result.stdout.strip().split('\n')
        status = {}
        for branch in branches:
            parts = branch.split()
            name = parts[1] if parts[0] == '*' else parts[0]
            ahead_behind = ' '.join(parts[2:])
            status[name] = ahead_behind
        return status
    except subprocess.CalledProcessError as e:
        print(f"Error getting branch status: {e}")
        exit(1)

def create_pull_request(repo, base, head):
    try:
        pr = repo.create_pull(
            title=f"Update {head} from {base}",
            body=f"Automatically generated PR to update {head} from {base}",
            base=head,
            head=base
        )
        print(f"Created PR: {pr.html_url}")
    except Exception as e:
        print(f"Error creating PR for {head}: {str(e)}")
        exit(1)

def main():
    # Ensure environment variables are set
    github_token = os.environ.get('GITHUB_TOKEN')
    github_repository = os.environ.get('GITHUB_REPOSITORY')
    
    if not github_token or not github_repository:
        print("Error: GITHUB_TOKEN and GITHUB_REPOSITORY environment variables must be set.")
        exit(1)

    # Get branch status
    branch_status = get_branch_status()

    # Print branch status
    print("Branch Status:")
    for branch, status in branch_status.items():
        print(f"{branch}: {status}")

    # Create PRs for branches that are behind
    try:
        g = Github(github_token)
        repo = g.get_repo(github_repository)
        main_branch = repo.default_branch

        for branch, status in branch_status.items():
            if branch != main_branch and 'behind' in status:
                create_pull_request(repo, main_branch, branch)
    except Exception as e:
        print(f"Error accessing GitHub repository: {e}")
        exit(1)

if __name__ == "__main__":
    main()