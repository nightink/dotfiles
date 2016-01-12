
'use strict';

const fs = require('fs');
const files = fs.readdirSync(__dirname);
const ignorePaths = [
  '.DS_Store',
  '.git',
  '.gitignore',
  'README.md',
  'git_submodule_init.sh',
  '.gitmodules',
  'package.json',
  'run.js',
  'npm-debug.log',
];

const dotfiles = files.filter((file) => ignorePaths.indexOf(file) < 0);

console.log('find dotfiles \n %s', JSON.stringify(dotfiles, null, 2));

dotfiles.forEach((fileOrDir) => {
  const dotSymLink = `${process.env.HOME}/${fileOrDir}`;
  try {
    fs.statSync(dotSymLink);
    console.warn('sym link %s is exist', dotSymLink);
  } catch (err) {
    if (err.code !== 'ENOENT') {
      console.error(err);
      return;
    }

    console.log('create sym link fileOrDir %s', fileOrDir);
    fs.symlinkSync(`${__dirname}/${fileOrDir}`, dotSymLink);
  }
});
