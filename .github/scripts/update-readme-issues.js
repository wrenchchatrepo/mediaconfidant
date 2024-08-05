const fs = require('fs');
const axios = require('axios');
const { execSync } = require('child_process');

const repoOwner = process.env.GITHUB_REPOSITORY.split('/')[0];
const repoName = process.env.GITHUB_REPOSITORY.split('/')[1];
const token = process.env.GITHUB_TOKEN;

async function fetchIssues() {
  const issues = await axios.get(`https://api.github.com/repos/${repoOwner}/${repoName}/issues`, {
    headers: {
      Authorization: `token ${token}`,
    },
  });

  return issues.data;
}

async function updateReadme(issues) {
  let readmeContent = fs.readFileSync('README.md', 'utf8');

  const issuesTable = issues.map(issue => `- [${issue.title}](${issue.html_url})`).join('\n');

  readmeContent = readmeContent.replace(
    /<!-- issueTableStart -->[\s\S]*<!-- issueTableEnd -->/,
    `<!-- issueTableStart -->\n${issuesTable}\n<!-- issueTableEnd -->`
  );

  fs.writeFileSync('README.md', readmeContent);
}

async function main() {
  try {
    // Debug: Print Git configuration
    console.log('Git User Name:', execSync('git config user.name').toString().trim());
    console.log('Git User Email:', execSync('git config user.email').toString().trim());
    console.log('Repository URL:', execSync('git remote get-url origin').toString().trim());

    const issues = await fetchIssues();
    await updateReadme(issues);
  } catch (error) {
    console.error('Error updating README:', error);
    process.exit(1);
  }
}

main();