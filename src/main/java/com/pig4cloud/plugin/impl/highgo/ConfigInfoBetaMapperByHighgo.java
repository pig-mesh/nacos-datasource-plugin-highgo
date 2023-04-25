package com.pig4cloud.plugin.impl.highgo;

import com.alibaba.nacos.plugin.datasource.constants.TableConstant;
import com.alibaba.nacos.plugin.datasource.mapper.AbstractMapper;
import com.alibaba.nacos.plugin.datasource.mapper.ConfigInfoBetaMapper;
import com.pig4cloud.plugin.constants.DataSourceConstant;

public class ConfigInfoBetaMapperByHighgo extends AbstractMapper implements ConfigInfoBetaMapper {

	@Override
	public String updateConfigInfo4BetaCas() {
		return "UPDATE config_info_beta SET content = ?,md5 = ?,beta_ips = ?,src_ip = ?,src_user = ?,gmt_modified = ?,app_name = ? "
				+ "WHERE data_id = ? AND group_id = ? AND tenant_id = ? AND (md5 = ? or md5 is null or md5 = '')";
	}

	@Override
	public String findAllConfigInfoBetaForDumpAllFetchRows(int startRow, int pageSize) {
		return " SELECT t.id,data_id,group_id,tenant_id,app_name,content,md5,gmt_modified,beta_ips,encrypted_data_key "
				+ " FROM ( SELECT id FROM config_info_beta  ORDER BY id LIMIT " + pageSize + " OFFSET " + startRow
				+ " )" + "  g, config_info_beta t WHERE g.id = t.id ";
	}

	@Override
	public String getTableName() {
		return TableConstant.CONFIG_INFO_BETA;
	}

	@Override
	public String getDataSource() {
		return DataSourceConstant.HIGHGO;
	}

}
