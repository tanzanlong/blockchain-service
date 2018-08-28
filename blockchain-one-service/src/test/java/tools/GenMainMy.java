package tools;

/**
 * 生产数据操作层代码
 * 
 * @author hbm
 *
 */
public class GenMainMy {
	public static void main(String[] args) {
		String configFile = "/generatorConfig.xml";
		try {
            // t_wine_channel_request_log t_authority_config
            String[] tableNames = new String[] {"t_account_balance_snapshot"};
			GenMybatisFiles.gen(configFile, tableNames);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
