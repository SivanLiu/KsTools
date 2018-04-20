package cn.wjdiankong.java2smali;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.charset.Charset;

public class Utils {

    public static void exec(String[] cmd) {
        Process process = null;
        try {
            process = Runtime.getRuntime().exec(cmd);
            String error = exec(process.getErrorStream());
            String result = exec(process.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (null != process) {
                process.destroy();
            }
        }
    }

    private static String exec(InputStream stream) {
        ByteArrayOutputStream outputStream = null;
        InputStream inputStream = null;
        try {
            inputStream = new BufferedInputStream(stream);
            outputStream = new ByteArrayOutputStream();
            write(inputStream, outputStream, 1024 * 8);
            byte[] bytes = outputStream.toByteArray();
            return new String(bytes, Charset.defaultCharset().name());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private static void write(InputStream inputStream, OutputStream outputStream, int bufSize)
            throws IOException {
        int count = -1;
        byte[] buffer = new byte[bufSize];
        while ((count = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, count);
        }
    }

    /**
     * 执行命令
     */
    public static boolean execCmd(String cmd, boolean isOutputLog) {
        BufferedReader br = null;
        try {
            Process p = Runtime.getRuntime().exec(cmd);
            br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;
            while ((line = br.readLine()) != null) {
                if (isOutputLog) {
                    System.out.println(line);
                }
            }
        } catch (Exception e) {
            System.out.println("cmd error:" + e.toString());
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }

    /**
     * 文件拷贝的方法
     */
    public static boolean fileCopy(String src, String des) {
        FileInputStream fis = null;
        FileOutputStream fos = null;
        try {
            fis = new FileInputStream(src);
            fos = new FileOutputStream(des);
            int len = 0;
            byte[] buffer = new byte[10 * 1024];
            while ((len = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
        } catch (Exception e) {
            System.out.println("拷贝文件失败:" + e.toString());
            return false;
        } finally {
            try {
                if (fis != null) {
                    fis.close();
                }
                if (fos != null) {
                    fos.close();
                }
            } catch (Exception e) {
                System.out.println("拷贝文件失败:" + e.toString());
                return false;
            }
        }
        return true;
    }

    public static String getClassName(String javaName) {
        try {
            int index = javaName.indexOf(".");
            return javaName.substring(0, index) + ".class";
        } catch (Exception e) {
            return javaName;
        }
    }

    public static String getFileName(String javaName) {
        try {
            int index = javaName.indexOf(".");
            return javaName.substring(0, index);
        } catch (Exception e) {
            return javaName;
        }
    }

    /**
     * 获取SDK的xml中配置信息
     */
    public static String getClassPkgName(String fileName) {
        FileReader fr = null;
        BufferedReader br = null;
        try {
            fr = new FileReader(fileName);
            br = new BufferedReader(fr);
            String line = null;
            while ((line = br.readLine()) != null) {
                if (line != null) {
                    if (line.startsWith("package")) {
                        return line.split("package")[1].replace(";", "").trim();
                    }
                }
            }
        } catch (Exception e) {
            return null;
        } finally {
            if (fr != null) {
                try {
                    fr.close();
                } catch (Exception e) {
                }
            }
            if (br != null) {
                try {
                    br.close();
                } catch (Exception e) {
                }
            }
        }
        return null;
    }

    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir
                        (new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        if (!dir.delete()) {
            System.out.println("delete failure");
            return false;
        }

        return true;
    }
}
