const https = require('https');

// Replace this with your GitHub token and URL
const githubToken = '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';
const commitUrl = 'https://github.com/wrenchchatrepo/mediaconfidant/commit/7afd6587b5a1ee278a426e6407b536c3766d7737';

const commitApiUrl = commitUrl.replace('https://github.com/', 'https://api.github.com/repos/')
                             .replace('/commit/', '/commits/');

const options = {
  hostname: 'api.github.com',
  path: new URL(commitApiUrl).pathname,
  method: 'GET',
  headers: {
    'Authorization': `token ${githubToken}`,
    'User-Agent': 'node.js', // GitHub requires a User-Agent header
    'Accept': 'application/vnd.github.v3+json'
  }
};

const req = https.request(options, res => {
  let data = '';

  res.on('data', chunk => {
    data += chunk;
  });

  res.on('end', () => {
    if (res.statusCode === 200) {
      const json = JSON.parse(data);
      const commitDate = json.commit.committer.date;
      console.log('Commit Date:', new Date(commitDate).toDateString());
    } else {
      console.error('Failed to fetch commit date:', res.statusCode, res.statusMessage);
      console.error('Response:', data);
    }
  });
});

req.on('error', error => {
  console.error('Error:', error);
});

req.end();