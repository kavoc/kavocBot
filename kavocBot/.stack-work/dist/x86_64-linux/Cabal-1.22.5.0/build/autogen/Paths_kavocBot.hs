module Paths_kavocBot (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kavoc/kavocBot/kavocBot/.stack-work/install/x86_64-linux/lts-6.3/7.10.3/bin"
libdir     = "/home/kavoc/kavocBot/kavocBot/.stack-work/install/x86_64-linux/lts-6.3/7.10.3/lib/x86_64-linux-ghc-7.10.3/kavocBot-0.1.0.0-HGrarGG2kWuFAAliHlLlee"
datadir    = "/home/kavoc/kavocBot/kavocBot/.stack-work/install/x86_64-linux/lts-6.3/7.10.3/share/x86_64-linux-ghc-7.10.3/kavocBot-0.1.0.0"
libexecdir = "/home/kavoc/kavocBot/kavocBot/.stack-work/install/x86_64-linux/lts-6.3/7.10.3/libexec"
sysconfdir = "/home/kavoc/kavocBot/kavocBot/.stack-work/install/x86_64-linux/lts-6.3/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "kavocBot_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "kavocBot_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "kavocBot_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "kavocBot_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "kavocBot_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
