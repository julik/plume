DELETE FROM Folders WHERE folderid IN
    (SELECT folderid FROM Folder WHERE path LIKE 'C:\MP3\Albums\' || '%');
