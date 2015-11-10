#!python
'''Builder for TEVA CANARY.

Changelog:
  2010-11-05: dbhart - Original creation and import
'''
import os, urllib, sys
from os.path import join, sep
from time import asctime
from optparse import OptionParser

def main():
    parser = OptionParser()
    parser.add_option("-c", "--compile", dest="doCompile", default=False,
                      help="compile the programs", action="store_true")
    parser.add_option("-f", "--full-installer", dest="doFullInstaller",
                      default=False, help="create the full installer",
                      action="store_true")
    parser.add_option("-u", "--update-installer", dest="doUpdateInstaller",
                      default=False, help="create an update installer",
                      action="store_true")
    parser.add_option("-s", "--source-installer", dest="doSourceInstaller",
                      default=False, help="create a source code installer",
                      action="store_true")
    parser.add_option("-t", "--run-tests", dest="doRunTests", default=False,
                      help="run the tests", action="store_true")
    
    (options, args) = parser.parse_args()
    if 'HUDSON_URL' in os.environ:
        hudson_url = os.environ['HUDSON_URL']
    else:
        hudson_url = 'https://software.sandia.gov/hudson/'
    if 'WORKSPACE' in os.environ:
        workspace = os.environ['WORKSPACE']
    else:
        workspace = os.getcwd()
    if 'INNOSETUP' in os.environ:
        path = os.environ['PATH'] + os.pathsep + os.environ['INNOSETUP']
        os.environ['PATH'] = path
        build_type = 'trunk'
        isstool = 'InnoSetup'
    else:
        build_type = 'trunk'
        isstool = 'zip'
    iss_data = (build_type, isstool)
    if 'MATLAB' in os.environ:
        path = os.environ['PATH'] + os.pathsep + os.environ['MATLAB'] + os.sep + 'bin\\win32'
        os.environ['PATH'] = path
    if 'VERSION_NUM' in os.environ:
        version_num = os.environ['VERSION_NUM']
        build_num = os.environ['BUILD_NUMBER']
        svn_rev = os.environ['SVN_REVISION']
        build_ids = os.environ['BUILD_ID'].split('_')
        build_id = build_ids[0] + ', ' + build_ids[1].replace('-',':')
        version = (version_num, 'b'+build_num+':r'+svn_rev, build_id, get_mcc_version())
    else:
        version = ('working', 'manual:local', asctime(), get_mcc_version())
    clean_build()
    if options.doCompile: 
        build_canary_exe(workspace, version)
    if options.doFullInstaller: 
        build_full_installer(workspace, version, hudson_url, iss_data)
    if options.doUpdateInstaller: 
        build_update_installer(workspace, version, hudson_url, iss_data)
    if options.doSourceInstaller: 
        build_source_installer(workspace, version, hudson_url, iss_data)
    if options.doRunTests: 
        run_tests()
    return

def getopts():
    parser = OptionParser()
    parser.add_option("-c", "--compile", dest="doCompile", default=False,
                      help="compile the programs", action="store_true")
    parser.add_option("-f", "--full-installer", dest="doFullInstaller",
                      default=False, help="create the full installer",
                      action="store_true")
    parser.add_option("-u", "--update-installer", dest="doUpdateInstaller",
                      default=False, help="create an update installer",
                      action="store_true")
    parser.add_option("-s", "--source-installer", dest="doSourceInstaller",
                      default=False, help="create a source code installer",
                      action="store_true")
    parser.add_option("-t", "--run-tests", dest="doRunTests", default=False,
                      help="run the tests", action="store_true")
    
    (options, args) = parser.parse_args()
    return (options, args)

def clean_build():
    imprint('BUILD: Cleaning build space')
    if 'WORKSPACE' in os.environ:
        workspace = os.environ['WORKSPACE']
    else:
        workspace = os.getcwd()
    my_name = join('bin','build.py')
    pkg_root = sys.argv[0].replace(sep+my_name,'')
    build_dir = join(workspace,'build')
    if sep == '/':
        os.system('rm -rf '+build_dir)
        os.system('cp -rf '+pkg_root+' '+build_dir)
    else:
        os.system('rmdir /Q /S '+build_dir)
        os.system('xcopy '+pkg_root+' '+build_dir+' /E /Q /Y /I')
    return

def get_mcc_version():
    imprint('BUILD: Obtaining MCC version information')
    os.system('mcc -o "canary" -v -? > help.txt')
    f = open('help.txt','r')
    mcc_version = f.readline()
    f.close()
    os.remove('help.txt')
    return mcc_version[2:-4]

def get_previous_artifacts(hudson_url, build_type):
    exe_url = hudson_url + 'job/Canary_'+build_type+'_build/lastSuccessfulBuild/' + \
                'artifact/build/canary.exe'
    jar_url = hudson_url + 'job/Canary_'+build_type+'_java/lastSuccessfulBuild/' + \
                'artifact/CanarysCore/dist/CanarysCore.jar'
    exe_dst = 'canary.exe'
    jar_dst = 'CanarysCore.jar'
    imprint('BUILD: Downloading from %s'%exe_url)
    urllib.urlretrieve(exe_url, filename=exe_dst)
    imprint('BUILD: Downloading from %s'%jar_url)
    urllib.urlretrieve(jar_url, filename=jar_dst)
    return

def build_full_installer(workspace, version, hudson_url, iss_data):
    os.chdir(join(workspace,'build','packages','install'))
    get_previous_artifacts(hudson_url, iss_data[0])
    if iss_data[1] == 'InnoSetup':
        imprint('BUILD: Running Inno Setup Tool')
        cmd = 'iscc.exe ' + '/dMyBuildNumber=%BUILD_NUMBER% ' + \
                '/dMySubversionRevision=%SVN_REVISION% ' + '/dWorkspace="%WORKSPACE%" ' +\
                '/dMATLAB="%MATLAB%" ' + 'setup-full.iss'
        os.system(cmd)
    elif iss_data[1] == 'zip':
        pass
    else:
        pass
    return

def build_update_installer(workspace, version, hudson_url, iss_data):
    os.chdir(join(workspace,'build','packages','install'))
    get_previous_artifacts(hudson_url, 'trunk')
    if iss_data[1] == 'InnoSetup':
        imprint('BUILD: Running Inno Setup Tool')
        cmd = 'iscc.exe ' + '/dMyBuildNumber=%BUILD_NUMBER% ' + \
                '/dMySubversionRevision=%SVN_REVISION% ' + '/dWorkspace="%WORKSPACE%" ' +\
                'setup-update.iss'
        os.system(cmd)
    elif iss_data[1] == 'zip':
        pass
    else:
        pass
    return

def build_source_installer(workspace, version, hudson_url, iss_data):
    os.chdir(join(workspace,'build','packages','install'))
    if iss_data[1] == 'InnoSetup':
        imprint('BUILD: Running Inno Setup Tool')
        cmd = 'iscc.exe ' + '/dMyBuildNumber=%BUILD_NUMBER% ' + \
                '/dMySubversionRevision=%SVN_REVISION% ' + '/dWorkspace="%WORKSPACE%" ' +\
                'setup-source.iss'
        imprint(cmd)
        os.system(cmd)
    elif iss_data[1] == 'zip':
        pass
    else:
        pass
    return

def build_canary_exe(workspace, version):
    '''
Build the CANARY executable files using the MATLAB compiler.
'''
    imprint('BUILD: Compiling CANARY Executables')
    os.chdir(join(workspace,'build','packages','matlab','src'))
    fin = open('canary.m','r')
    lines = fin.readlines()
    fin.close()
    fout = open('canary.m','w')
    for line in lines:
        oline = line.replace('#GlobalRev#',
                             '%s (%s, %s) [MATLAB %s] on win32'%(version[0],
                                 version[1], version[2], version[3]))
        fout.write(oline)
    fout.close()
    os.chdir(join(workspace,'build','packages','matlab','build'))
    os.system('mcc.exe -F canary.prj')
    pass

def run_tests():
    '''
#!/bin/bash
ln -s -f ${WORKSPACE}/trunk/examples/sample_data ${WORKSPACE}/trunk/packages/sample_data
cd ${WORKSPACE}/trunk/packages/matlab/src
echo "addpath $WORKSPACE/trunk/packages/matlab/src" > startup.m
echo "addpath $WORKSPACE/trunk/tpl" >> startup.m
sed -e s/\#GlobalRev\#/${SVN_REVISION}-native/ canary.m > canary2.m
cp canary2.m canary.m
rm canary2.m
matlab -nodesktop -nosplash -nodisplay -r "add_drivers('/home/hudson/slave/drivers'); canary --self-test $WORKSPACE/trunk/packages/test results ''; quit();"
'''
    pass
    
def imprint(my_str):
    os.system('echo '+my_str)
    return

if __name__ == '__main__':
    main()
