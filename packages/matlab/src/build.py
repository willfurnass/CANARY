#!python
'''Builder for TEVA CANARY.

Changelog:
  2010-11-05: dbhart - Original creation and import
'''
import os, urllib, sys
from os.path import join, sep
from time import asctime

def main():
    if 'VERSION_NUM' in os.environ:
        version_num = os.environ['VERSION_NUM']
        build_num = os.environ['BUILD_NUMBER']
        svn_rev = os.environ['SVN_REVISION_1']
        build_ids = os.environ['BUILD_ID'].split('_')
        build_id = build_ids[0] + ', ' + build_ids[1].replace('-',':')
        version = (version_num, 'b'+build_num+':r'+svn_rev, build_id, get_mcc_version())
    else:
        version = ('working', 'manual:local', asctime(), get_mcc_version())
    build_canary_exe(version)
    return

def get_mcc_version():
    imprint('BUILD: Obtaining MCC version information')
    os.system('mcc -o "canary" -v -? > help.txt')
    f = open('help.txt','r')
    mcc_version = f.readline()
    f.close()
    os.remove('help.txt')
    return mcc_version[2:-4]

def build_canary_exe(version):
    '''
Build the CANARY executable files using the MATLAB compiler.
'''
    imprint('BUILD: Compiling CANARY Executables')
    fin = open('print_version.m','r')
    lines = fin.readlines()
    fin.close()
    fout = open('print_version.m','w')
    for line in lines:
        oline = line.replace('#GlobalRev#',
                             '%s (%s, %s)'%(version[0],
                                 version[1], version[2]))
        fout.write(oline)
    fout.close()
    if '_x32' in os.environ['JOB_NAME']:
        os.system('deploytool /build canary_x32.prj')
    elif '_x64' in os.environ['JOB_NAME']:
        os.system('deploytool /build canary_x64.prj')
    elif '_gnlx64' in os.environ['JOB_NAME']:
        os.system('deploytool -build canary_glnx64.prj')
    else:
        os.system('mcc -F canary.prj')
    return

def imprint(my_str):
    os.system('echo '+my_str)
    return

if __name__ == '__main__':
    main()
