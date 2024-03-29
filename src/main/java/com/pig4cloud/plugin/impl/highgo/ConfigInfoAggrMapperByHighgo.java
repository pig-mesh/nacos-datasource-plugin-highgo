package com.pig4cloud.plugin.impl.highgo;

import com.alibaba.nacos.plugin.datasource.constants.TableConstant;
import com.alibaba.nacos.plugin.datasource.mapper.AbstractMapper;
import com.alibaba.nacos.plugin.datasource.mapper.ConfigInfoAggrMapper;
import com.pig4cloud.plugin.constants.DataSourceConstant;

import java.util.List;

public class ConfigInfoAggrMapperByHighgo extends AbstractMapper implements ConfigInfoAggrMapper {

	/**
	 * 批量删除
	 * @param datumList
	 * @return
	 */
	public String batchRemoveAggr(List<String> datumList) {
		final StringBuilder datumString = new StringBuilder();
		for (String datum : datumList) {
			datumString.append('\'').append(datum).append("',");
		}
		datumString.deleteCharAt(datumString.length() - 1);
		return "DELETE FROM config_info_aggr WHERE data_id = ? AND group_id = ? AND tenant_id = ? AND datum_id IN ("
				+ datumString + ")";
	}

	@Override
	public String aggrConfigInfoCount(int size, boolean isIn) {
		StringBuilder sql = new StringBuilder(
				"SELECT count(*) FROM config_info_aggr WHERE data_id = ? AND group_id = ? AND tenant_id = ? AND datum_id");
		if (isIn) {
			sql.append(" IN (");
		}
		else {
			sql.append(" NOT IN (");
		}
		for (int i = 0; i < size; i++) {
			if (i > 0) {
				sql.append(", ");
			}
			sql.append('?');
		}
		sql.append(')');

		return sql.toString();
	}

	@Override
	public String findConfigInfoAggrIsOrdered() {
		return "SELECT data_id,group_id,tenant_id,datum_id,app_name,content FROM "
				+ "config_info_aggr WHERE data_id = ? AND group_id = ? AND tenant_id = ? ORDER BY datum_id";
	}

	@Override
	public String findConfigInfoAggrByPageFetchRows(int startRow, int pageSize) {
		return "SELECT data_id,group_id,tenant_id,datum_id,app_name,content FROM config_info_aggr WHERE data_id= ? AND "
				+ "group_id= ? AND tenant_id= ? ORDER BY datum_id LIMIT " + pageSize + " OFFSET " + startRow;
	}

	@Override
	public String findAllAggrGroupByDistinct() {
		return "SELECT DISTINCT data_id, group_id, tenant_id FROM config_info_aggr";
	}

	@Override
	public String getTableName() {
		return TableConstant.CONFIG_INFO_AGGR;
	}

	@Override
	public String getDataSource() {
		return DataSourceConstant.HIGHGO;
	}

}
