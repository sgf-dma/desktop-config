
module Sgf.Desktop.Install
  where

import Data.List
import System.Directory.Extra

import Development.Shake
import Development.Shake.FilePath

-- * Library functions.
--
-- $library

-- | Replace path prefix @old@ (starting and ending at path component
-- boundaries) with @new@, if matched:
--
-- >    replacePrefix old new path
replacePrefix ::   FilePath     -- ^ @Old@ path prefix to replace with.
                -> FilePath     -- ^ @New@ path prefix to substitute to.
                -> FilePath     -- ^ Path.
                -> FilePath     -- ^ Resulting path.
replacePrefix old new x  = maybe x (combine new . joinPath) $
    -- For ensuring that path prefix starts and ends at path components
    -- (directories) boundaries, i first split them.
    stripPrefix (splitDirectories old) (splitDirectories x)

-- | Add file rule for installing a file by just copying a source.
installFile :: String       -- ^ Extension.
                -> FilePath  -- ^ Install path.
                -> FilePath  -- ^ Source path.
                -> Rules ()
installFile ext prefix srcdir   = prefix ++ "//*" <.> ext %> \out -> do
              let src = replacePrefix prefix srcdir out
              need [src]
              putNormal $ "> Copy " ++ src ++ " -> " ++ out
              liftIO $ copyFile src out

-- * Constants.
--
-- $constants

sourceDir :: FilePath
sourceDir           = "src"

-- * Main.
--
-- $main

install :: IO ()
install             = shakeArgs shakeOptions $ do
    h <- liftIO getHomeDirectory

    "ritsuko" ~> need ["desktopEntries"]

    -- Install '.desktop' files.
    let applicationsDir = h </> ".local/share/applications"
    "desktopEntries" ~> do
        xs <- liftIO $ listFiles sourceDir
        let ys  = map (applicationsDir </>)
                    . filter ((== ".desktop") . takeExtension)
                    . map takeFileName
                    $ xs
        need ys
    installFile "desktop" applicationsDir sourceDir

